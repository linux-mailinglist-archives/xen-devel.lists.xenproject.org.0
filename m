Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA7C717D7A
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 12:59:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541731.844772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4JXt-0003Jb-4b; Wed, 31 May 2023 10:59:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541731.844772; Wed, 31 May 2023 10:59:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4JXt-0003Gr-1E; Wed, 31 May 2023 10:59:13 +0000
Received: by outflank-mailman (input) for mailman id 541731;
 Wed, 31 May 2023 10:59:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GGHB=BU=gmail.com=oleshiiwood@srs-se1.protection.inumbo.net>)
 id 1q4JXs-0003Gj-3R
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 10:59:12 +0000
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [2607:f8b0:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ba98c11-ffa2-11ed-b231-6b7b168915f2;
 Wed, 31 May 2023 12:59:10 +0200 (CEST)
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-3982f09df74so3469189b6e.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 03:59:10 -0700 (PDT)
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
X-Inumbo-ID: 2ba98c11-ffa2-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685530749; x=1688122749;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QnowcQLYOUDL3eO3KJWamGlJ6VxLfJvvh+2QsHdm1JM=;
        b=VMFNt3nGERsiDB47HOAzmrI5CEW9DYmDjxxizJbz3z5R+i6AHtX/vtQj17quTUbGsr
         Kac3EIWK5aLLvpVkzs8hggHdunsa+JJZxwCZSo4wHZY4+UlJEoDOB+VrfZBg1xq/6wM5
         e/L0zehor9mxthSLQYe4RbZFGdk6CfhQj8gLVb8UpoaX+rJ8Z5PxsvTRPf+RFiByoXVw
         EJiXGXO8LkDVkVbgHNr7FcC04LXxGtMBxB0njHeXnTVVUCAsqFF9TbIsNlxaYsmbGatW
         3pF8FbIOvzB6u8h/T0J9O4ekk5ZNagAGfGGmOwmWGnsJuiK/rmSnV/Cr3JvfTVPbxkFP
         SZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685530749; x=1688122749;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QnowcQLYOUDL3eO3KJWamGlJ6VxLfJvvh+2QsHdm1JM=;
        b=LLm+bECNLd3doY4oDKAOQJdTW32k+3u0qNFTOob/H32y8pMTYHNe6p3w2zp9dEyDPr
         h7nWt5ejsNVJWH+11kV2GpOzI7CttGooXGV2ZegnPVPELbP8SVSXy70FBt6fVR2gp9a0
         cVl0OQIBO5ZCG3vEHJjC2seKBLxttiXVVLGflsmGNgvpKj6WmZn6G3+LxzgU6qLWctRe
         0fqWSp9oqDdUCH/L+WW9p5r5/l8CFGyWLMpk4cgWXGvuqlYLfkpFCs1/M7Xmv+SZ3TLG
         cQKrRR/6KEitrRdniqrUX059/qwYrJ/5Q5VORKagvpG2O1LlcdZpnqFg7doXdPTA58ak
         +URg==
X-Gm-Message-State: AC+VfDxJ+HAjq9jIckYuWJp+bXlv6nHoRFM4DbDRbUE9gsE7oeVv+NII
	N0kC1PRfbQALxpacWIqbjbvL/XmaC3LQSdYQhPQXOTsiPxp21w==
X-Google-Smtp-Source: ACHHUZ75X95nz6Oz8/tpPBB2B0aGPjoq82yF2Cuw9WUdr5r2yi9k00PkkRDUj+vE71MNHue558K7nCOxEUN2Lc1IgC0=
X-Received: by 2002:a05:6808:13d4:b0:398:59fe:6ee3 with SMTP id
 d20-20020a05680813d400b0039859fe6ee3mr4623999oiw.54.1685530748889; Wed, 31
 May 2023 03:59:08 -0700 (PDT)
MIME-Version: 1.0
From: Oleg Nikitenko <oleshiiwood@gmail.com>
Date: Wed, 31 May 2023 14:04:42 +0300
Message-ID: <CA+SAi2tnribWcyORs3P-8za0aJx3t5NcOXCo1g917Csgowpb9g@mail.gmail.com>
Subject: xen with colors issue again
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000008baf2705fcfb35c8"

--0000000000008baf2705fcfb35c8
Content-Type: text/plain; charset="UTF-8"

Hello,

I built the xlnx_rebase_4.17 branch and ran it in our environment with
colors.
I ran into the next issue. Looks like some device was stucking.
It may come up immediately on start or after 20-30 minutes later even with
no DomUs.
A xen command line is
"console=dtuart dtuart=serial0 dom0_mem=1800M dom0_max_vcpus=2
dom0_vcpus_pin bootscrub=0 vwfi=native sched=null timer_slop=0
llc-coloring=on llc-way-size=64K xen-llc-colors=0-1 dom0-llc-colors=2-8";

This is a first one coming up

(XEN) d0v0 Forwarding AES operation: 3254779951
Assert occurred from file xcsudma.c at line 143

I found out this is inside some DMA handler in FSBL code

void XCsuDma_Transfer(XCsuDma *InstancePtr, XCsuDma_Channel Channel,
                                        u64 Addr, u32 Size, u8 EnDataLast)

        Xil_AssertVoid(Size <= (u32)(XCSUDMA_SIZE_MAX));

This is a second one coming up.

[  188.737910] zynqmp_aes firmware:zynqmp-firmware:zynqmp-aes: ERROR: Gcm
Tag mismatch
(XEN) d0v0 Forwarding AES operation: 3254779951
[  188.748496] zynqmp_aes firmware:zynqmp-firmware:zynqmp-aes: ERROR : Non
word aligned data
(XEN) d0v0 Forwarding AES operation: 3254779951
[  198.826279] zynqmp_aes firmware:zynqmp-firmware:zynqmp-aes: ERROR : Non
word aligned data
(XEN) d0v0 Forwarding AES operation: 3254779951
[  198.837363] zynqmp_aes firmware:zynqmp-firmware:zynqmp-aes: ERROR:
Invalid
(XEN) d0v0 Forwarding AES operation: 3254779951
Received exception
MSR: 0x200, EAR: 0x181, EDR: 0x0, ESR: 0x861
[  229.916284] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[  229.916667] (detected by 1, t=5252 jiffies, g=1953, q=101)
[  229.922286] rcu: All QSes seen, last rcu_sched kthread activity 5252
(4294949715-4294944463), jiffies_till_next_fqs=1, root ->qsmask 0x0
[  229.934569] rcu: rcu_sched kthread timer wakeup didn't happen for 5251
jiffies! g1953 f0x2 RCU_GP_WAIT_FQS(5) ->state=0x200
[  229.945727] rcu: Possible timer handling issue on cpu=0
timer-softirq=3481
[  229.952734] rcu: rcu_sched kthread starved for 5252 jiffies! g1953 f0x2
RCU_GP_WAIT_FQS(5) ->state=0x200 ->cpu=0
[  229.962940] rcu: Unless rcu_sched kthread gets sufficient CPU time, OOM
is now expected behavior.
[  229.971936] rcu: RCU grace-period kthread stack dump:
[  229.977041] task:rcu_sched       state:R stack:    0 pid:   12 ppid:
2 flags:0x00000008
[  229.985433] Call trace:
[  229.987939]  __switch_to+0xf4/0x13c
[  229.991486]  __schedule+0x2f0/0x690
[  229.995032]  schedule+0x5c/0xc4
[  229.998232]  schedule_timeout+0x80/0xf0
[  230.002125]  rcu_gp_fqs_loop+0xf0/0x2b4
[  230.006017]  rcu_gp_kthread+0xe8/0x100
[  230.009824]  kthread+0x120/0x130
[  230.013111]  ret_from_fork+0x10/0x20
[  230.016744] rcu: Stack dump where RCU GP kthread last ran:
[  230.022279] Task dump for CPU 0:
[  230.025567] task:tokio-runtime-w state:R  running task     stack:    0
pid:  795 ppid:   408 flags:0x00000000
[  230.035514] Call trace:
[  230.038022]  __switch_to+0xf4/0x13c
[  230.041569]  0xffffffae44320a00
[  292.936283] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[  292.936646] (detected by 1, t=21007 jiffies, g=1953, q=113)
[  292.942354] rcu: All QSes seen, last rcu_sched kthread activity 21007
(4294965470-4294944463), jiffies_till_next_fqs=1, root ->qsmask 0x0
[  292.954723] rcu: rcu_sched kthread timer wakeup didn't happen for 21006
jiffies! g1953 f0x2 RCU_GP_WAIT_FQS(5) ->state=0x200
[  292.965968] rcu: Possible timer handling issue on cpu=0
timer-softirq=3481
[  292.972975] rcu: rcu_sched kthread starved for 21007 jiffies! g1953 f0x2
RCU_GP_WAIT_FQS(5) ->state=0x200 ->cpu=0
[  292.983268] rcu: Unless rcu_sched kthread gets sufficient CPU time, OOM
is now expected behavior.
[  292.992264] rcu: RCU grace-period kthread stack dump:
[  292.997368] task:rcu_sched       state:R stack:    0 pid:   12 ppid:
2 flags:0x00000008
[  293.005759] Call trace:
[  293.008266]  __switch_to+0xf4/0x13c
[  293.011814]  __schedule+0x2f0/0x690
[  293.015359]  schedule+0x5c/0xc4
[  293.018560]  schedule_timeout+0x80/0xf0
[  293.022453]  rcu_gp_fqs_loop+0xf0/0x2b4
[  293.026345]  rcu_gp_kthread+0xe8/0x100
[  293.030151]  kthread+0x120/0x130
[  293.033438]  ret_from_fork+0x10/0x20
[  293.037071] rcu: Stack dump where RCU GP kthread last ran:
[  293.042607] Task dump for CPU 0:
[  293.045895] task:tokio-runtime-w state:R  running task     stack:    0
pid:  795 ppid:   408 flags:0x00000000
[  293.055842] Call trace:
[  293.058350]  __switch_to+0xf4/0x13c
[  293.061897]  0xffffffae44320a00

Maybe someone will be able to give me some hints where I should make sense ?

Regards,
Oleg

--0000000000008baf2705fcfb35c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>Hello,</div><div><br></div><div>I buil=
t the xlnx_rebase_4.17 branch and ran it in our environment with colors.</d=
iv><div>I ran into the next issue. Looks like some device was stucking.<br>=
</div><div>It may come up immediately on start or after 20-30 minutes later=
 even with no DomUs.</div><div>A xen command line is <br></div><div>&quot;c=
onsole=3Ddtuart dtuart=3Dserial0 dom0_mem=3D1800M=20
dom0_max_vcpus=3D2 dom0_vcpus_pin bootscrub=3D0 vwfi=3Dnative sched=3Dnull=
=20
timer_slop=3D0 llc-coloring=3Don llc-way-size=3D64K xen-llc-colors=3D0-1=20
dom0-llc-colors=3D2-8&quot;;</div><div><br></div><div>This is a first one c=
oming up<br></div><div></div><div><div></div><div><br></div><div>(XEN) d0v0=
 Forwarding AES operation: 3254779951<br>Assert occurred from file xcsudma.=
c at line 143</div><div><br></div><div>I found out this is inside some DMA =
handler in FSBL code<br></div><div><br></div><div>void XCsuDma_Transfer(XCs=
uDma *InstancePtr, XCsuDma_Channel Channel,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u64 Addr, u32 Size, u8 EnDataLast)<b=
r><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Xil_AssertVoid(Size &lt;=3D (u32)(XCSUDMA=
_SIZE_MAX));<br><br></div></div><div>This is a second one coming up.</div><=
div><br></div><div>[ =C2=A0188.737910] zynqmp_aes firmware:zynqmp-firmware:=
zynqmp-aes: ERROR: Gcm Tag mismatch<br>(XEN) d0v0 Forwarding AES operation:=
 3254779951<br>[ =C2=A0188.748496] zynqmp_aes firmware:zynqmp-firmware:zynq=
mp-aes: ERROR : Non word aligned data<br>(XEN) d0v0 Forwarding AES operatio=
n: 3254779951<br>[ =C2=A0198.826279] zynqmp_aes firmware:zynqmp-firmware:zy=
nqmp-aes: ERROR : Non word aligned data<br>(XEN) d0v0 Forwarding AES operat=
ion: 3254779951<br>[ =C2=A0198.837363] zynqmp_aes firmware:zynqmp-firmware:=
zynqmp-aes: ERROR: Invalid<br>(XEN) d0v0 Forwarding AES operation: 32547799=
51<br>Received exception<br>MSR: 0x200, EAR: 0x181, EDR: 0x0, ESR: 0x861<br=
>[ =C2=A0229.916284] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:<br=
>[ =C2=A0229.916667] 	(detected by 1, t=3D5252 jiffies, g=3D1953, q=3D101)<=
br>[ =C2=A0229.922286] rcu: All QSes seen, last rcu_sched kthread activity =
5252 (4294949715-4294944463), jiffies_till_next_fqs=3D1, root -&gt;qsmask 0=
x0<br>[ =C2=A0229.934569] rcu: rcu_sched kthread timer wakeup didn&#39;t ha=
ppen for 5251 jiffies! g1953 f0x2 RCU_GP_WAIT_FQS(5) -&gt;state=3D0x200<br>=
[ =C2=A0229.945727] rcu: 	Possible timer handling issue on cpu=3D0 timer-so=
ftirq=3D3481<br>[ =C2=A0229.952734] rcu: rcu_sched kthread starved for 5252=
 jiffies! g1953 f0x2 RCU_GP_WAIT_FQS(5) -&gt;state=3D0x200 -&gt;cpu=3D0<br>=
[ =C2=A0229.962940] rcu: 	Unless rcu_sched kthread gets sufficient CPU time=
, OOM is now expected behavior.<br>[ =C2=A0229.971936] rcu: RCU grace-perio=
d kthread stack dump:<br>[ =C2=A0229.977041] task:rcu_sched =C2=A0 =C2=A0 =
=C2=A0 state:R stack: =C2=A0 =C2=A00 pid: =C2=A0 12 ppid: =C2=A0 =C2=A0 2 f=
lags:0x00000008<br>[ =C2=A0229.985433] Call trace:<br>[ =C2=A0229.987939] =
=C2=A0__switch_to+0xf4/0x13c<br>[ =C2=A0229.991486] =C2=A0__schedule+0x2f0/=
0x690<br>[ =C2=A0229.995032] =C2=A0schedule+0x5c/0xc4<br>[ =C2=A0229.998232=
] =C2=A0schedule_timeout+0x80/0xf0<br>[ =C2=A0230.002125] =C2=A0rcu_gp_fqs_=
loop+0xf0/0x2b4<br>[ =C2=A0230.006017] =C2=A0rcu_gp_kthread+0xe8/0x100<br>[=
 =C2=A0230.009824] =C2=A0kthread+0x120/0x130<br>[ =C2=A0230.013111] =C2=A0r=
et_from_fork+0x10/0x20<br>[ =C2=A0230.016744] rcu: Stack dump where RCU GP =
kthread last ran:<br>[ =C2=A0230.022279] Task dump for CPU 0:<br>[ =C2=A023=
0.025567] task:tokio-runtime-w state:R =C2=A0running task =C2=A0 =C2=A0 sta=
ck: =C2=A0 =C2=A00 pid: =C2=A0795 ppid: =C2=A0 408 flags:0x00000000<br>[ =
=C2=A0230.035514] Call trace:<br>[ =C2=A0230.038022] =C2=A0__switch_to+0xf4=
/0x13c<br>[ =C2=A0230.041569] =C2=A00xffffffae44320a00<br>[ =C2=A0292.93628=
3] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:<br>[ =C2=A0292.93664=
6] 	(detected by 1, t=3D21007 jiffies, g=3D1953, q=3D113)<br>[ =C2=A0292.94=
2354] rcu: All QSes seen, last rcu_sched kthread activity 21007 (4294965470=
-4294944463), jiffies_till_next_fqs=3D1, root -&gt;qsmask 0x0<br>[ =C2=A029=
2.954723] rcu: rcu_sched kthread timer wakeup didn&#39;t happen for 21006 j=
iffies! g1953 f0x2 RCU_GP_WAIT_FQS(5) -&gt;state=3D0x200<br>[ =C2=A0292.965=
968] rcu: 	Possible timer handling issue on cpu=3D0 timer-softirq=3D3481<br=
>[ =C2=A0292.972975] rcu: rcu_sched kthread starved for 21007 jiffies! g195=
3 f0x2 RCU_GP_WAIT_FQS(5) -&gt;state=3D0x200 -&gt;cpu=3D0<br>[ =C2=A0292.98=
3268] rcu: 	Unless rcu_sched kthread gets sufficient CPU time, OOM is now e=
xpected behavior.<br>[ =C2=A0292.992264] rcu: RCU grace-period kthread stac=
k dump:<br>[ =C2=A0292.997368] task:rcu_sched =C2=A0 =C2=A0 =C2=A0 state:R =
stack: =C2=A0 =C2=A00 pid: =C2=A0 12 ppid: =C2=A0 =C2=A0 2 flags:0x00000008=
<br>[ =C2=A0293.005759] Call trace:<br>[ =C2=A0293.008266] =C2=A0__switch_t=
o+0xf4/0x13c<br>[ =C2=A0293.011814] =C2=A0__schedule+0x2f0/0x690<br>[ =C2=
=A0293.015359] =C2=A0schedule+0x5c/0xc4<br>[ =C2=A0293.018560] =C2=A0schedu=
le_timeout+0x80/0xf0<br>[ =C2=A0293.022453] =C2=A0rcu_gp_fqs_loop+0xf0/0x2b=
4<br>[ =C2=A0293.026345] =C2=A0rcu_gp_kthread+0xe8/0x100<br>[ =C2=A0293.030=
151] =C2=A0kthread+0x120/0x130<br>[ =C2=A0293.033438] =C2=A0ret_from_fork+0=
x10/0x20<br>[ =C2=A0293.037071] rcu: Stack dump where RCU GP kthread last r=
an:<br>[ =C2=A0293.042607] Task dump for CPU 0:<br>[ =C2=A0293.045895] task=
:tokio-runtime-w state:R =C2=A0running task =C2=A0 =C2=A0 stack: =C2=A0 =C2=
=A00 pid: =C2=A0795 ppid: =C2=A0 408 flags:0x00000000<br>[ =C2=A0293.055842=
] Call trace:<br>[ =C2=A0293.058350] =C2=A0__switch_to+0xf4/0x13c<br>[ =C2=
=A0293.061897] =C2=A00xffffffae44320a00</div><div><br></div><div>Maybe some=
one will be able to give me some hints where I should make sense ?</div><di=
v><br></div><div>Regards,</div><div>Oleg<br></div><div></div><div></div><di=
v></div></div>

--0000000000008baf2705fcfb35c8--

