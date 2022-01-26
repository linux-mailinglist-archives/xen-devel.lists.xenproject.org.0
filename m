Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9885C49D148
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 18:57:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261066.451634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCmWi-0004Th-BL; Wed, 26 Jan 2022 17:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261066.451634; Wed, 26 Jan 2022 17:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCmWi-0004R2-7j; Wed, 26 Jan 2022 17:56:12 +0000
Received: by outflank-mailman (input) for mailman id 261066;
 Wed, 26 Jan 2022 17:56:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MeDS=SK=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nCmWg-0004Qw-Qt
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 17:56:11 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e89::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 395f805d-7ed1-11ec-8eb8-a37418f5ba1a;
 Wed, 26 Jan 2022 18:56:03 +0100 (CET)
Received: from DM5PR11CA0022.namprd11.prod.outlook.com (2603:10b6:3:115::32)
 by MN2PR02MB5950.namprd02.prod.outlook.com (2603:10b6:208:10f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 17:55:59 +0000
Received: from DM3NAM02FT051.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:115:cafe::e8) by DM5PR11CA0022.outlook.office365.com
 (2603:10b6:3:115::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Wed, 26 Jan 2022 17:55:58 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 DM3NAM02FT051.mail.protection.outlook.com (10.13.4.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Wed, 26 Jan 2022 17:55:58 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 26 Jan 2022 17:55:57 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 26 Jan 2022 17:55:57 +0000
Received: from [10.71.116.247] (port=38624)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nCmWS-0002pR-C9; Wed, 26 Jan 2022 17:55:56 +0000
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
X-Inumbo-ID: 395f805d-7ed1-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=exGEIaYKj7WQGlsAAfQ1ORNSwwCAYPF+M3kEyH/2i+LM9odT5qh5SG8SdMNCIFSUe8+n6h//P4iMWD9Njy8D+CsC1hIjsVzR3jgEPq6byQ7Ot0DmQQpjcJoeb63oLebWOJR4xcEj043wTlhdLqkNNLoe6LisN0kj1mYJsBAKJ/2/GRQXYpfPYtykIJJYvn1GMWb5d4f06SExne9LYnNFPESqx72c5St1+noCPvIFfmky0J6geYror6UOKjgm5449WN7gWkih6Zry5mNyfGKOgPU6OKpgyVGwRHJ+Foz64gcgrVOce6czRcu5RS9327ku3oS3F63LbwSnX9nGDDS7RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+Qkz71br8G7IERB5odIk3JaTrcYrSZwlDfqRHpXBlI=;
 b=L4/yKrwCNq2uN6TvkcbpSqsfOXKQuaFv4Zv6s5+WMgEv1ZR2TwANrpMFFPPj00P7owtxWGGQA22vAv/UcxnUJPd7Gqd//ajkKszOx65Eybf/zu9QdGsweigU2s7J+9pbbGA/1s3iYy2XqGJKz6wf6QUOlLrbtdwpmZDwdnrkdwynCaM7GkoKWoUxrXtEX0dWVU3Hd5RB+Mfg6ZD2BbdOZfVesGC7HVeBciwETsY/AW8fGC2+3AMKv0geK8nxDRvvznee4SCPWq7MBonReiPC8U8W6Xquv0ptkfGj6fznmRlVwszNrs4nMFNpBz+kK4GI+ys2jGD9bw8d1mm25Q5KeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+Qkz71br8G7IERB5odIk3JaTrcYrSZwlDfqRHpXBlI=;
 b=BAp5PVmsSGTPUYXVYnCbsWgdQnb2ZoB+OqiyMNZHYHQ6QcPWBu2qfoGazqmLmYFN1V79ghnrGRTWTdapVPqJy7hHzgMbFVo0jBq0MuTWvjwCFZCogzX+/Q0+ISgK8nBdMx0pkYn0xKPgW+ltmczu2ElAde0TYtzXBChxJO0mpTc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Content-Type: multipart/alternative;
	boundary="------------epmAppan1bONUB1uCPALluni"
Message-ID: <eeedbb72-d881-363d-c862-234b705eaec7@xilinx.com>
Date: Wed, 26 Jan 2022 17:55:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [XEN v1] xen/arm: io: Check ESR_EL2.ISV != 0 before searching for
 a MMIO handler
To: Julien Grall <julien.grall.oss@gmail.com>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, <stefanos@xilinx.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20220126165827.61168-1-ayankuma@xilinx.com>
 <CAJ=z9a1KjOAeR4vpRQGA_sYSvx1h331NKim2bgG8jyru94Beow@mail.gmail.com>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <CAJ=z9a1KjOAeR4vpRQGA_sYSvx1h331NKim2bgG8jyru94Beow@mail.gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 701c60a3-7074-4d3d-c7c8-08d9e0f51bd6
X-MS-TrafficTypeDiagnostic: MN2PR02MB5950:EE_
X-Microsoft-Antispam-PRVS:
	<MN2PR02MB5950FF045111923A0B90E5BFB2209@MN2PR02MB5950.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4ZFY0x23NTmasRqSk0pBQ4RZ76NzOLlBXf6TYSl7dkZyMxFH6nncb/O090p2iz9Gr3RqPRl40keMATfkyjCst4FAoSSthVTjqGLXZaNNz0hSG0N8080Wzo4//xzY7XNhZJz1acAW9WltMYjfBohHEqJbi44KFrNppeCmIXtgAqnOUShgqKsO0MA4awHHcm6NJhruQFpKjobWRTg7sZZH9FSq35VoYq/FagQ4exafVDYts1Vj/tyaun++ExhldpKLUubZ0MtD7VDENyY65QZSP9z5SgX4r2nmgmVT9KSSAfoRr3xEdCzyIGvvTCh0C7/+6lIEDiNJvg0QxpWwuE7UivcpIAhTj7ZOUplbhOtEsH/OvTctK8pPH/2lAkGeFIeN21MD8/txsjH81Ml8mMyHZ1rO4O3fAPZV3ttRlwXvXeTcgHaxkPFmqe0jwbL/6YhJfyHDPvqh0GNqHpcIelEJA5Lre+dgzA28AUZA12ATGHAWnQxVVIKbZ32HZMDx8c6K3g6RTaE4QlnVtAxDLMt1LwcRJi081vgYnIHFPcEqdNxcZ4/qUkqBqx7PE9Cp0DNcP7vqlmsTapPjtmP4i8Zwtmbii34jdCaNNPvTaNfQ0RMw5r9TaF3vpG5YBZOWPuTVi6K/bPkGWi7LJDSwEMyi9MRVsL/5AmM/YwSECR7haMqZGQJbGJasM836rFdRKz6gWtDiUZ8qhsdKuWZDHPz0gT42+FUx2SeKPXArC7ka4uffM/yi0SsGyQJARNjulDwL2xzD5eBK/9B3YCQRkn5INjp883vgfRG3GqxtNRvvNvGHehNr94ji/AXCE0JNmB4vwtgzX/LGZ9MT+aLu621UBQ==
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(36860700001)(36756003)(508600001)(966005)(7636003)(166002)(2906002)(54906003)(110136005)(2616005)(47076005)(31686004)(356005)(82310400004)(8936002)(8676002)(4326008)(426003)(316002)(70586007)(70206006)(83380400001)(186003)(26005)(21615005)(33964004)(31696002)(9786002)(40460700003)(336012)(53546011)(5660300002)(50156003)(51383001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 17:55:58.5962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 701c60a3-7074-4d3d-c7c8-08d9e0f51bd6
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT051.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB5950

--------------epmAppan1bONUB1uCPALluni
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Julien,

On 26/01/2022 17:22, Julien Grall wrote:
> Hi,
>
> On Wed, 26 Jan 2022, 16:58 Ayan Kumar Halder, 
> <ayan.kumar.halder@xilinx.com> wrote:
>
>     Refer to Armv8 ARM DDI 0487G.b, Page D13-3219 "ISS encoding for an
>     exception
>     from a Data Abort" :-
>     ISV - ISS[23:14] holds a valid instruction syndrome
>
>     When the ISV is 0, the instruction could not be decoded by the
>     hardware (ie ISS
>     is invalid). One should immediately return an error to the caller
>     with an
>     appropriate error message. 
>
>
> That's going to be very spammy because we have use-case where it could 
> trap without a valid ISV (e.g. when break-before-make happens). So 
> please don't had a message.

There is already a logging statement in traps.c :-

inject_abt:
     gdprintk(XENLOG_DEBUG,
              "HSR=%#"PRIregister" pc=%#"PRIregister" gva=%#"PRIvaddr" 
gpa=%#"PRIpaddr"\n",
              hsr.bits, regs->pc, gva, gpa);

The reason for the error is to give the user some hint that an IO abort 
is triggered by Xen. Can we keep the error message ?

Also, I think this is a duplicate check 
https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/ioreq.c;h=308650b40051825fdea78bb33bfbcc87ef5deaff;hb=HEAD#l79 
, I will remove this in v2 if it makes sense.

- Ayan

>
> That makes me think that the same will be valid for your other patch.
>
>     There is no use of the MMIO handler. This is the
>     reason why one should check for ISV before attempting to find a
>     MMIO handler.
>
>     Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
>     ---
>
>     Suggested by Julien Grall in
>     https://lists.xenproject.org/archives/html/xen-devel/2022-01/msg01245.html
>
>      xen/arch/arm/io.c | 11 +++++++----
>      1 file changed, 7 insertions(+), 4 deletions(-)
>
>     diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>     index 729287e37c..14d39222f2 100644
>     --- a/xen/arch/arm/io.c
>     +++ b/xen/arch/arm/io.c
>     @@ -109,6 +109,13 @@ enum io_state try_handle_mmio(struct
>     cpu_user_regs *regs,
>
>          ASSERT(hsr.ec <http://hsr.ec> == HSR_EC_DATA_ABORT_LOWER_EL);
>
>     +    /* All the instructions used on emulated MMIO region should
>     be valid */
>     +    if ( !dabt.valid )
>     +    {
>     +        gprintk(XENLOG_DEBUG, "No valid instruction syndrome for
>     data abort\n");
>     +        return IO_ABORT;
>     +    }
>     +
>          handler = find_mmio_handler(v->domain, info.gpa);
>          if ( !handler )
>          {
>     @@ -121,10 +128,6 @@ enum io_state try_handle_mmio(struct
>     cpu_user_regs *regs,
>              return rc;
>          }
>
>     -    /* All the instructions used on emulated MMIO region should
>     be valid */
>     -    if ( !dabt.valid )
>     -        return IO_ABORT;
>     -
>          /*
>           * Erratum 766422: Thumb store translation fault to
>     Hypervisor may
>           * not have correct HSR Rt value.
>     -- 
>     2.17
>
--------------epmAppan1bONUB1uCPALluni
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Julien,</p>
    <div class="moz-cite-prefix">On 26/01/2022 17:22, Julien Grall
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJ=z9a1KjOAeR4vpRQGA_sYSvx1h331NKim2bgG8jyru94Beow@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="auto">
        <div>Hi,<br>
          <br>
          <div class="gmail_quote">
            <div dir="ltr" class="gmail_attr">On Wed, 26 Jan 2022, 16:58
              Ayan Kumar Halder, &lt;<a
                href="mailto:ayan.kumar.halder@xilinx.com"
                moz-do-not-send="true" class="moz-txt-link-freetext">ayan.kumar.halder@xilinx.com</a>&gt;
              wrote:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">Refer to
              Armv8 ARM DDI 0487G.b, Page D13-3219 "ISS encoding for an
              exception<br>
              from a Data Abort" :-<br>
              ISV - ISS[23:14] holds a valid instruction syndrome<br>
              <br>
              When the ISV is 0, the instruction could not be decoded by
              the hardware (ie ISS<br>
              is invalid). One should immediately return an error to the
              caller with an<br>
              appropriate error message. </blockquote>
          </div>
        </div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">That's going to be very spammy because we have
          use-case where it could trap without a valid ISV (e.g. when
          break-before-make happens). So please don't had a message.</div>
      </div>
    </blockquote>
    <p>There is already a logging statement in traps.c :-</p>
    <p>inject_abt:<br>
          gdprintk(XENLOG_DEBUG,<br>
                   "HSR=%#"PRIregister" pc=%#"PRIregister"
      gva=%#"PRIvaddr" gpa=%#"PRIpaddr"\n",<br>
                   hsr.bits, regs-&gt;pc, gva, gpa);<br>
    </p>
    <p>The reason for the error is to give the user some hint that an IO
      abort is triggered by Xen. Can we keep the error message ?<br>
    </p>
    <p>Also, I think this is a duplicate check
<a class="moz-txt-link-freetext" href="https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/ioreq.c;h=308650b40051825fdea78bb33bfbcc87ef5deaff;hb=HEAD#l79">https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/ioreq.c;h=308650b40051825fdea78bb33bfbcc87ef5deaff;hb=HEAD#l79</a>
      , I will remove this in v2 if it makes sense.</p>
    <p>- Ayan<br>
    </p>
    <blockquote type="cite"
cite="mid:CAJ=z9a1KjOAeR4vpRQGA_sYSvx1h331NKim2bgG8jyru94Beow@mail.gmail.com">
      <div dir="auto">
        <div dir="auto"><br>
        </div>
        <div dir="auto">That makes me think that the same will be valid
          for your other patch.</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">There is
              no use of the MMIO handler. This is the<br>
              reason why one should check for ISV before attempting to
              find a MMIO handler.<br>
              <br>
              Signed-off-by: Ayan Kumar Halder &lt;<a
                href="mailto:ayankuma@xilinx.com" target="_blank"
                rel="noreferrer" moz-do-not-send="true"
                class="moz-txt-link-freetext">ayankuma@xilinx.com</a>&gt;<br>
              ---<br>
              <br>
              Suggested by Julien Grall in <a
href="https://lists.xenproject.org/archives/html/xen-devel/2022-01/msg01245.html"
                rel="noreferrer noreferrer" target="_blank"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://lists.xenproject.org/archives/html/xen-devel/2022-01/msg01245.html</a><br>
              <br>
               xen/arch/arm/io.c | 11 +++++++----<br>
               1 file changed, 7 insertions(+), 4 deletions(-)<br>
              <br>
              diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c<br>
              index 729287e37c..14d39222f2 100644<br>
              --- a/xen/arch/arm/io.c<br>
              +++ b/xen/arch/arm/io.c<br>
              @@ -109,6 +109,13 @@ enum io_state try_handle_mmio(struct
              cpu_user_regs *regs,<br>
              <br>
                   ASSERT(<a href="http://hsr.ec" rel="noreferrer
                noreferrer" target="_blank" moz-do-not-send="true">hsr.ec</a>
              == HSR_EC_DATA_ABORT_LOWER_EL);<br>
              <br>
              +    /* All the instructions used on emulated MMIO region
              should be valid */<br>
              +    if ( !dabt.valid )<br>
              +    {<br>
              +        gprintk(XENLOG_DEBUG, "No valid instruction
              syndrome for data abort\n");<br>
              +        return IO_ABORT;<br>
              +    }<br>
              +<br>
                   handler = find_mmio_handler(v-&gt;domain, info.gpa);<br>
                   if ( !handler )<br>
                   {<br>
              @@ -121,10 +128,6 @@ enum io_state try_handle_mmio(struct
              cpu_user_regs *regs,<br>
                       return rc;<br>
                   }<br>
              <br>
              -    /* All the instructions used on emulated MMIO region
              should be valid */<br>
              -    if ( !dabt.valid )<br>
              -        return IO_ABORT;<br>
              -<br>
                   /*<br>
                    * Erratum 766422: Thumb store translation fault to
              Hypervisor may<br>
                    * not have correct HSR Rt value.<br>
              -- <br>
              2.17<br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------epmAppan1bONUB1uCPALluni--

