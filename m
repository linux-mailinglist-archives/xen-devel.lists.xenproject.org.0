Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D823F850F86
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 10:15:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679377.1056819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZSPb-0003BZ-6r; Mon, 12 Feb 2024 09:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679377.1056819; Mon, 12 Feb 2024 09:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZSPb-00039q-37; Mon, 12 Feb 2024 09:15:39 +0000
Received: by outflank-mailman (input) for mailman id 679377;
 Mon, 12 Feb 2024 09:15:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JouK=JV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rZSPZ-00039i-IK
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 09:15:37 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47a5563a-c987-11ee-98f5-efadbce2ee36;
 Mon, 12 Feb 2024 10:15:35 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 170D22219E
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 09:15:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 053A313985
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 09:15:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id NANAO7bhyWX8fgAAD6G6ig
 (envelope-from <jgross@suse.com>)
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 09:15:34 +0000
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
X-Inumbo-ID: 47a5563a-c987-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707729335; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JRdQMcodzFSdYrOamMCxcGPN5Rd6DHQ4WUwCyZUyz0I=;
	b=esFuAI39UNAenLvfYM+R4AH78o1uTGME7Tbu5r93W9pUOqoKMfOXTJuCePXHwWksXPBkpA
	HcOkB+nFlmzAGMh85OTqZ5OHKXrLaSdEQ1kKFXAlSyP8k63ZngZNQPGKkJgin48YDY00Cm
	E0FeCEAeTG84eZCcMzbUcbrp6LYpzI4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707729335; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JRdQMcodzFSdYrOamMCxcGPN5Rd6DHQ4WUwCyZUyz0I=;
	b=esFuAI39UNAenLvfYM+R4AH78o1uTGME7Tbu5r93W9pUOqoKMfOXTJuCePXHwWksXPBkpA
	HcOkB+nFlmzAGMh85OTqZ5OHKXrLaSdEQ1kKFXAlSyP8k63ZngZNQPGKkJgin48YDY00Cm
	E0FeCEAeTG84eZCcMzbUcbrp6LYpzI4=
Message-ID: <99873f03-217d-4799-bc4b-df841cf4b039@suse.com>
Date: Mon, 12 Feb 2024 10:15:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Errors when trying to create VM with "channel" device(s)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.46
X-Spamd-Result: default: False [-3.46 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 MIME_GOOD(-0.10)[text/plain];
	 PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCPT_COUNT_ONE(0.00)[1];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 TO_DN_EQ_ADDR_ALL(0.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(0.83)[subject];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Flag: NO

A customer is complaining to be unable to create multiple "channel" devices
in a HVM domain. I've verified the same happens with upstream Xen.

The "channel" configuration is:

channel = [ "connection=socket, name=test.ch1, path=/run/testsocket1", 
"connection=socket, name=test.ch2, path=/run/testsocket2" ]

When creating the domain, I see:

libxl: error: libxl_console.c:285:libxl__device_console_add: Domain 4:Primary 
console has invalid configuration

Both /run/testsocket1 and /run/testsocket2 are being created in dom0.

"xl channel-list 4" gives me:
Idx BE state evt-ch ring-ref connection
0   0  1     -1     -1       socket

"xenstore-ls /local/domain/0/backend/console/4" prints only one channel:
1 = ""
  frontend = "/local/domain/4/device/console/1"
  frontend-id = "4"
  online = "1"
  state = "2"
  protocol = "vt100"
  name = "test.ch2"
  connection = "socket"
  path = "/run/testsocket2"
  hotplug-status = "connected"
0 = ""
  frontend = "/local/domain/4/console"
  frontend-id = "4"
  online = "1"
  state = "1"
  protocol = "vt100"

While qemu seems to have been started with the information for both.
Output of "xl -vvv create":

...
libxl: debug: libxl_dm.c:2994:libxl__spawn_local_dm: Domain 4:  -chardev
libxl: debug: libxl_dm.c:2994:libxl__spawn_local_dm: Domain 4: 
socket,id=libxl-channel0,path=/run/testsocket1,server=on,wait=off
libxl: debug: libxl_dm.c:2994:libxl__spawn_local_dm: Domain 4:  -chardev
libxl: debug: libxl_dm.c:2994:libxl__spawn_local_dm: Domain 4: 
socket,id=libxl-channel1,path=/run/testsocket2,server=on,wait=off
...

"xenstore-ls /local/domain/4/device/console" only shows:
1 = ""
  backend = "/local/domain/0/backend/console/4/1"
  backend-id = "0"
  state = "1"
  protocol = "vt100"
  name = "test.ch2"
  limit = "1048576"
  type = "ioemu"
  output = "chardev:libxl-channel1"
  tty = ""

So the console AND the first channel are missing.

"xenstore-ls /local/domain/4/error" shows:
device = ""
  console = ""
   1 = ""
    error = "22 xenbus_dev_probe on device/console/1"

Now doing the same with only one "channel" device shows the same error when
creating the guest. The guest has no channel device after that and the Xenstore
error node is not present.

I'm not that familiar with this code area, so I thought I post this here in the
hope someone has an idea where to look first.


Juergen

