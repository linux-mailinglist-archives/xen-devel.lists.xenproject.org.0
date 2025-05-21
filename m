Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1804BABF685
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 15:46:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991889.1375690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHjmK-0007J5-EL; Wed, 21 May 2025 13:46:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991889.1375690; Wed, 21 May 2025 13:46:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHjmK-0007GM-B2; Wed, 21 May 2025 13:46:40 +0000
Received: by outflank-mailman (input) for mailman id 991889;
 Wed, 21 May 2025 13:46:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Tfb=YF=dingwall.me.uk=james@srs-se1.protection.inumbo.net>)
 id 1uHjmI-0007GG-HX
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 13:46:38 +0000
Received: from smarthost01c.sbp.mail.zen.net.uk
 (smarthost01c.sbp.mail.zen.net.uk [212.23.1.5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00d0b36c-364a-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 15:46:32 +0200 (CEST)
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
 by smarthost01c.sbp.mail.zen.net.uk with esmtpsa (TLS1.0) tls
 TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (Exim 4.95)
 (envelope-from <james@dingwall.me.uk>) id 1uHjm9-001FTY-DV;
 Wed, 21 May 2025 13:46:30 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id B9EEBCB6CD9;
 Wed, 21 May 2025 14:46:30 +0100 (BST)
Received: from mail0.xen.dingwall.me.uk ([IPv6:::1])
 by localhost (mail0.xen.dingwall.me.uk [IPv6:::1]) (amavis, port 10024)
 with ESMTP id RvbEaheKPvE1; Wed, 21 May 2025 14:46:30 +0100 (BST)
Received: from behemoth.dingwall.me.uk (behemoth.dingwall.me.uk
 [IPv6:2a02:8010:698e:302::c0a8:105])
 by dingwall.me.uk (Postfix) with ESMTP id 7C3B1CB6CD6;
 Wed, 21 May 2025 14:46:30 +0100 (BST)
Received: by behemoth.dingwall.me.uk (Postfix, from userid 1000)
 id 324F8F9245F; Wed, 21 May 2025 14:46:29 +0100 (BST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 00d0b36c-364a-11f0-b892-0df219b8e170
X-Virus-Scanned: Debian amavis at dingwall.me.uk
Date: Wed, 21 May 2025 14:46:29 +0100
From: James Dingwall <james-xen@dingwall.me.uk>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul@xen.org>
Subject: viridian time_ref_count triggers guest clock drift
Message-ID: <aC3ZNTg0z8xu9V9H@dingwall.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Originating-smarthost01c-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189

Hi,

I've been looking at clock drift problem we've been having in Windows VMs
which seems to come down to whether the time_ref_count enlightenment is
enabled for the guest.  For migration compatibility reasons we had the
list expanded to:

viridian = ['base', 'freq', 'time_ref_count', 'apic_assist', 'crash_ctl']

The drift is no longer observed with:

viridian = ['base', 'freq', 'apic_assist', 'crash_ctl']


The drift is also absent with (enabled stime causes the guest gets stuck in
boot):

viridian = ['all', '!time_ref_count', '!stime']


The drift is observed with:

viridian = 1


The method of testing the drift was to execute the following command in
the guest:

w32tm /stripchart /computer:0.pool.ntp.org /rdtsc

first and last lines of output, default sample period is 2s, total 41 samples:

The current time is 15/05/2025 14:32:25.
RdtscStart, RdtscEnd, FileTime, RoundtripDelay, NtpOffset
391444616392, 391478090002, 133917895450376964, +00.0100979, +10.3926898
...
637570858836, 637609379234, 133917896256928566, +00.0135181, +17.8456872


Curiously the rate of drift is exacerbated by using 'spice = 1' approx
0.1s / s, vs 'spice = 0' approx 0.02s / s.  When 'time_ref_count' is set it
is possible to observe a higher than expected frequency in the guest 'System
Information' (also reported with get-wmiobject Win32_Processor -Property
CurrentClockSpeed) but the registry key HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\CentralProcessor\0
~MHz was set to the expected speed and agreed with `xl debug-key s` output.

Forcing the guest to use the platform clock (presumably using the hpet) also
prevented the clock from drifting.

bcdedit /set useplatformclock yes

Other options relating to "Guest Virtual Time Controls" were tested without
any option resolving the problem.  We could reproduce this with Intel and
AMD processors.

Guest operating system: Windows 2012, Windows 10

Xen version: 4.19.3-pre, 4.18.3, 4.15.4, 4.14.3 (our internal ticket was opened
for the two older releases but they haven't been checked again)

Xen params: console=vga,com2 console_timestamps=datems dom0_max_vcpus=4-8 dom0_mem=min:6144,max:65536m iommu=on,required,intpost,verbose,debug x2apic=off sched=credit2 flask=enforcing gnttab_max_frames=128 xpti=off smt=on cpufreq=xen:performance spec-ctrl=gds-mit=0 com2=115200,8n1
Guest config:

memory = 2048
vcpus = 2
cpu_weight=256
pae = 1
acpi = 1
apic = 1
xen_platform_pci = 1
viridian = ['base', 'freq', 'apic_assist', 'crash_ctl']
vga = 'stdvga'
videoram = 16
soundhw = 'hda'
spice = 1
spicehost = '127.0.0.1'
spiceport = 35999
spicedisable_ticketing = 1
spicevdagent = 1
spice_clipboard_sharing = 0
spice_image_compression = 'auto_glz'
sdl = 0
vnc = 1
vncunused = 0
vnclisten = '0.0.0.0:99'
usb = 0
usbdevice = 'tablet'
keymap = 'en-us'
vif = [
    'vifname=winguest{%domid}.0,script=vif-local,bridge=wan,mac=00:16:3e:01:6e:d8,backend=netdom'
]
name = 'winguest-00'
uuid = '08092537-70b6-4248-bfc4-4f6ecd92c230'
disk = [
    'phy:/dev/zvol/ztank/08092537-70b6-4248-bfc4-4f6ecd92c230/c,hda,w,no-discard',
    'phy:/dev/zvol/ztank/08092537-70b6-4248-bfc4-4f6ecd92c230/d,hdb,w,no-discard'
]
type = 'hvm'
dm_restrict = 1
device_model_chroot = 0
device_model_override = '/usr/lib/xen/bin/qemu-system-i386'
device_model_args = [
  '-object', 'tls-creds-x509,id=tls0,endpoint=client,dir=/etc/certificates/usb,verify-peer=yes,sanity-check=no',
  # SERIAL
  '-chardev', 'socket,id=charredir_serial0,host=127.0.0.1,port=48051,reconnect=2,nodelay=on,keepalive=on,user-timeout=3250',
  '-device', 'isa-serial,chardev=charredir_serial0',
  '-chardev', 'socket,id=charredir_serial1,host=127.0.0.1,port=48052,reconnect=2,nodelay=on,keepalive=on,user-timeout=3250',
  '-device', 'isa-serial,chardev=charredir_serial1',
  '-chardev', 'socket,id=charredir_serial2,host=127.0.0.1,port=48053,reconnect=2,nodelay=on,keepalive=on,user-timeout=3250',
  '-device', 'pci-serial,chardev=charredir_serial2',
  '-trace', 'events=/etc/xen/qemu-trace-options',
]
boot = 'cn'
localtime = 1
on_poweroff = 'destroy'
on_crash = 'preserve'
on_reboot = 'destroy'
seclabel = 'system_u:system_r:migrate_domU_t'


If there's any further information which would be useful please let me know.

Thanks,
James

