Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 061C31F3E15
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 16:27:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jifCo-0005Xv-Pt; Tue, 09 Jun 2020 14:26:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K0Bv=7W=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jifCm-0005Xo-Na
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 14:26:20 +0000
X-Inumbo-ID: 2f4278a4-aa5d-11ea-b7bb-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f4278a4-aa5d-11ea-b7bb-bc764e2007e4;
 Tue, 09 Jun 2020 14:26:19 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: rt+6U3WZm4rtikJxcqUk0gEVNQADr72s+8TPUpC4uPUOA/SdTsOQBTumWjWF2qTdOcRHLtJ9a+
 HKmfljcPtAc/dYb20p3dX6DfDLQI6NzT9hAOsFhWfhN44mX++mN2KiSBGWhaVaVHRuiaKdJY0z
 yuewOiFsMymrtNQbL5c4pS0TvcZh41cazMWz49X2AdmOsNW1l4xg14tKhL2azAHwqK+Zn4qBYA
 7SuKZG5JpTwWE9Okk236kuHtC1jnRAEKsiXbVJT1m49XNbOwRPASJsawmibZajjkynOB4ldMeV
 agQ=
X-SBRS: 2.7
X-MesageID: 19600043
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,492,1583211600"; d="scan'208";a="19600043"
From: George Dunlap <George.Dunlap@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: TESTDAY Report: Unexpected results for xenhyps
Thread-Topic: TESTDAY Report: Unexpected results for xenhyps
Thread-Index: AQHWPmnv/u+9i0TYCEuGnSB4UmFapQ==
Date: Tue, 9 Jun 2020 14:26:15 +0000
Message-ID: <062D5150-C24E-4A81-834C-9794510F0229@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D42C45D5339C7A4FA42FC2D42E863C39@citrix.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Playing around with the new `xenhypfs` binary, got some unexpected results:

* Unexpected error message for non-existent nodes

Command executed:

# xenhypfs cat /params/loglvlx
could not read: Operation not permitted

Expected behavior: -ENOENT-style message
Actual behavior: -EACCESS-style message

* Truncated output from /params/loglvl

root@immortal:~# xenhypfs write /params/loglvl none
root@immortal:~# xenhypfs cat /params/loglvl
none/non
root@immortal:~# xenhypfs write /params/loglvl error
root@immortal:~# xenhypfs cat /params/loglvl
error/er
root@immortal:~# xenhypfs write /params/loglvl warning
root@immortal:~# xenhypfs cat /params/loglvl
warning/

Expected behavior: Full new string printed (`none/none`, `error/error`, `wa=
rning/warning` respectively)

Actual behavior: Only 8 characters ever printed

* Same as above for /params/guest_loglvl


Everything else looks OK.

# xl info
xl info
host                   : immortal
release                : 5.2.0-2-amd64
version                : #1 SMP Debian 5.2.9-2 (2019-08-21)
machine                : x86_64
nr_cpus                : 8
max_cpu_id             : 31
nr_nodes               : 1
cores_per_socket       : 4
threads_per_core       : 2
cpu_mhz                : 2533.431
hw_caps                : bfebfbff:029ee3ff:2c100800:00000001:00000000:00000=
000:00000000:00000100
virt_caps              : pv hvm hvm_directio pv_directio hap shadow
total_memory           : 6141
free_memory            : 5028
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 14
xen_extra              : .0-rc
xen_version            : 4.14.0-rc
xen_caps               : xen-3.0-x86_64 xen-3.0-x86_32p hvm-3.0-x86_32 hvm-=
3.0-x86_32p hvm-3.0-x86_64
xen_scheduler          : credit2
xen_pagesize           : 4096
platform_params        : virt_start=3D0xffff800000000000
xen_changeset          :
xen_commandline        : placeholder dom0_mem=3D1024M,max:1024M cpuinfo com=
1=3D115200,8n1 console=3Dcom1,tty loglvl=3Dall guest_loglvl=3Dall acpi_slee=
p=3Ds3_fake debug_synthetic_preemption=3D1024
cc_compiler            : gcc (Debian 9.2.1-30) 9.2.1 20200224
cc_compile_by          : root
cc_compile_domain      :
cc_compile_date        : Tue Jun  9 13:32:54 UTC 2020
build_id               : da97d170bfab3ccce05773f63cffdce3e3cc52ba
xend_config_format     : 4



