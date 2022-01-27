Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED94449E33B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 14:20:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261474.452787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD4hO-0000j3-UK; Thu, 27 Jan 2022 13:20:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261474.452787; Thu, 27 Jan 2022 13:20:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD4hO-0000fu-Qa; Thu, 27 Jan 2022 13:20:26 +0000
Received: by outflank-mailman (input) for mailman id 261474;
 Thu, 27 Jan 2022 13:20:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T5dr=SL=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nD4hM-0000fo-Rg
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 13:20:24 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062f.outbound.protection.outlook.com
 [2a01:111:f400:fe59::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e071e7c7-7f73-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 14:20:22 +0100 (CET)
Received: from BN9PR03CA0578.namprd03.prod.outlook.com (2603:10b6:408:10d::13)
 by SJ0PR02MB8829.namprd02.prod.outlook.com (2603:10b6:a03:3d4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Thu, 27 Jan
 2022 13:20:18 +0000
Received: from BN1NAM02FT014.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:10d:cafe::d3) by BN9PR03CA0578.outlook.office365.com
 (2603:10b6:408:10d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Thu, 27 Jan 2022 13:20:18 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT014.mail.protection.outlook.com (10.13.2.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 13:20:18 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 27 Jan 2022 13:20:17 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 27 Jan 2022 13:20:17 +0000
Received: from [10.71.118.179] (port=33714)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nD4hE-0005Ip-8n; Thu, 27 Jan 2022 13:20:16 +0000
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
X-Inumbo-ID: e071e7c7-7f73-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJFAk4CvrrOAq8BFmNcg/JjwjRMFeD+H5SxAX6M/rNwx67+S49aIHRekX2nor9/tGJvSBljDLS8FNXauRt7yMDn7XGjWcs4SsrUyN3d175vU2C3Adp0zs2FkY93TJXV2s9CdVV4n/h2lXRAIc9rT6UvbWWsSXrPJar+ep7t3Po78yorbuWUXiWrBaJOktgIsjrR9zsDrhhXOm9QUBrKZmRtnRIyRnD+j6NEKHEEDg0CPhPQi3Pebw6T6k4KifBBHC9KCSNw+F724MfOZ1FYEEJ7jvupv/jmeE+B8RidCOSeJkK9iWwu5MYeMRU+XyfRcWquAv8G5w49C6FW0LMTilA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OM8eBfZ8IooPMdkJRKSLF+5ERYarMti6W2Zv7eXSUDw=;
 b=EktcXVEBqW6QkDXnKngDU2Y7ZjNsgcSZ3WcXvukArmdtRMdoZnMy4XApA/6/5Xf5KyFS08oWPb816GEnNOFefagu5qr0mItq/4KpyUxzetExYBUifotr6wj7MafRD60SnhoykM+PCLKY0NJWH9kd0UyBvaY6u6T1P0yHnUf/O8QvJ/Y8HjT1kiXbDmqj+/W0OBXg0wC23iXlYeg0PYefWPG4NlGj1+u2Puc2WnxYamoWOEJdmgzEkc2rJZ/5GN6rKocXPWO6s5Oszxh+y+cbhm7YmlA2WzgAIkuRrPenOuZFzqhS3/8CKXDkSuvR55t4Dxye/a8qAS3aSoXttQBvjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OM8eBfZ8IooPMdkJRKSLF+5ERYarMti6W2Zv7eXSUDw=;
 b=pIe68JJCVEURAYNhQJ5pTmSWP9tZ6lY4Pj/FVMRMpUGbf9wjUI6GWNP7dRH9Mic0gyeAJg38x002IzkyWOUhLMG1y7o06cIVG/B3zzzLF70uzU798oXDUOM0us/sC2OU14rcjr14rUIE7RvM+cne2Cc6Orz65PDJym+bXn9Hy+U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Message-ID: <bee7ea7a-6d3d-bf3c-4b5f-d40deb601867@xilinx.com>
Date: Thu, 27 Jan 2022 13:20:15 +0000
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
 <eeedbb72-d881-363d-c862-234b705eaec7@xilinx.com>
 <CAJ=z9a0VEqr_ODQZvdsO82PiOpHt5-TVc4JWE5pJCeNYPh+XHg@mail.gmail.com>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
In-Reply-To: <CAJ=z9a0VEqr_ODQZvdsO82PiOpHt5-TVc4JWE5pJCeNYPh+XHg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8ab30fd-f3df-4450-cea2-08d9e197c36c
X-MS-TrafficTypeDiagnostic: SJ0PR02MB8829:EE_
X-Microsoft-Antispam-PRVS:
	<SJ0PR02MB8829939F16C21104EF6B170CB2219@SJ0PR02MB8829.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LeRv3TJtreISUNre/aceUMkO4GDkDh4mYsmCIAlhf8etqwNJcwYD69EG6b3z9k+BAStRZVPvmcrpfh0RZvZ+iPE73KAQNUlUbIgJuAHNGI/HAnhI1TVsj32mDF4Hazx0McURp7amf8eoRrrY2b+vv/4u9G9jxxJipnOuMZJ46ullhsf3lQNpqlMJojHwQwJSLitak9VvGrXU/n6rtz47YywUUOstmngxtja3Sb749iXHuhPsrSZnJEI9cEGKc3NzQ12Yi//UILlYFGTxyhASBAAGNSLUeElJ9pJn4n8znM90caHNiEXmjUQrLUhgLR570orK3n59MqtoCAS4oQCATJ9mswJ5tge7L3XnrcNz5bYgn0S6buS3zmWLzZ2idUAUesoDfd3dHgMDxCKsXX7gBf01ta8JpM9i3zcyKasRh90PfWmPvc8MhXlVugE1i4rJ7MjQ7ExJVMqzYKY7pVtb5w04YT76JCwhO2t4PosX2ZiaSAX+SdOZ9UT6H6ROHhRAL0VAYjAGOcOfahuOCMMYz/Klmb2DJt/OwkrGFwzIlcgDL/ZDsA1Q9aIvI37XOg1mcWD1TGu/3FgzvqJPEqp7UOLNMtaLyjJ/kttuqSgtNitROJm1WBx0g8PcAOJXBR4LbAAQ7K6mm6VLaM440fbfT1V6RF19m9Do20QGsLUwYBPqqNwpVp0f1/TNUpXKEbCJMr+pEiIgJ+MXEwaX8jsF8EjoOcFlvfMJ3oGdKBumPTKXJo1SBaSmr4ATeeUsO5Ei2AQIq+zzSt+J7PzeLTSTdjSkepsp0YHp1SDvKgfyGxTyplzP0fZ3tg3nTiQ5V/t1iMgLSantapsCCpRfmVA6CnO59jaiNrSkoT6UOtRhze1Mbmylggh0uguiLSIhj3Ga+JhFrW4cjiDQ4UGPu+RBU4JH0VOOPeN5QCd2bM2vTRFLTPK5NXPHhDC+YaG3LEOP
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(40470700004)(8676002)(2906002)(54906003)(9786002)(5660300002)(966005)(82310400004)(316002)(31686004)(186003)(110136005)(36860700001)(70586007)(4326008)(83380400001)(2616005)(31696002)(336012)(356005)(47076005)(26005)(53546011)(426003)(40460700003)(36756003)(8936002)(7636003)(70206006)(508600001)(50156003)(51383001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 13:20:18.3072
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ab30fd-f3df-4450-cea2-08d9e197c36c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT014.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8829

Hi,

Asking here as well (might not have been clear on irc).

On 27/01/2022 00:10, Julien Grall wrote:
> Hi,
>
> On Wed, 26 Jan 2022, 17:56 Ayan Kumar Halder, 
> <ayan.kumar.halder@xilinx.com> wrote:
>
>     Hi Julien,
>
>     On 26/01/2022 17:22, Julien Grall wrote:
>>     Hi,
>>
>>     On Wed, 26 Jan 2022, 16:58 Ayan Kumar Halder,
>>     <ayan.kumar.halder@xilinx.com> wrote:
>>
>>         Refer to Armv8 ARM DDI 0487G.b, Page D13-3219 "ISS encoding
>>         for an exception
>>         from a Data Abort" :-
>>         ISV - ISS[23:14] holds a valid instruction syndrome
>>
>>         When the ISV is 0, the instruction could not be decoded by
>>         the hardware (ie ISS
>>         is invalid). One should immediately return an error to the
>>         caller with an
>>         appropriate error message. 
>>
>>
>>     That's going to be very spammy because we have use-case where it
>>     could trap without a valid ISV (e.g. when break-before-make
>>     happens). So please don't had a message.
>
>     There is already a logging statement in traps.c :-
>
>     inject_abt:
>         gdprintk(XENLOG_DEBUG,
>                  "HSR=%#"PRIregister" pc=%#"PRIregister"
>     gva=%#"PRIvaddr" gpa=%#"PRIpaddr"\n",
>                  hsr.bits, regs->pc, gva, gpa);
>
>     The reason for the error is to give the user some hint that an IO
>     abort is triggered by Xen.
>
> The main difference here is inject_dabt should only be reached when we 
> exhausted all the possibility in I/O handling.
>
> In your case, if we can't handle as an MMIO then we should fallthrough 
> the other method (see do_trap_stage2_abort_guest()).
>
> In fact, moving the check early and doing the decoding before 
> find_mmio() or try_fwd_io() is actually wrong. Sorry I should realized 
> that earlier.

Why should we care about MMIO when ISS is invalid ? Should we not check 
first if the ISS is valid or not as it will trigger IO_abort regardless 
of the MMIO.

I am assuming that once Xen resolves the MMIO 
(p2m_resolve_translation_fault()), the guest will again try to run the 
same instruction on MMIO region. This will be trapped in Xen which will 
return IO abort as the post-indexing instruction could not be decoded.

In this scenario, translation fault resolved by Xen was of no use.

Please help to clear my doubts.

- Ayan

>
> So we want to provide an helper that will do the dabt.vid check and do 
> the decoding. The helper will be called in 2 places.
>
> With that in place, then I agree the gprintk could be kept in place.
>
>     Can we keep the error message ?
>
>     Also, I think this is a duplicate check
>     https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/ioreq.c;h=308650b40051825fdea78bb33bfbcc87ef5deaff;hb=HEAD#l79
>     , I will remove this in v2 if it makes sense.
>
>     - Ayan
>
>>
>>     That makes me think that the same will be valid for your other patch.
>>
>>         There is no use of the MMIO handler. This is the
>>         reason why one should check for ISV before attempting to find
>>         a MMIO handler.
>>
>>         Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
>>         ---
>>
>>         Suggested by Julien Grall in
>>         https://lists.xenproject.org/archives/html/xen-devel/2022-01/msg01245.html
>>
>>          xen/arch/arm/io.c | 11 +++++++----
>>          1 file changed, 7 insertions(+), 4 deletions(-)
>>
>>         diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>>         index 729287e37c..14d39222f2 100644
>>         --- a/xen/arch/arm/io.c
>>         +++ b/xen/arch/arm/io.c
>>         @@ -109,6 +109,13 @@ enum io_state try_handle_mmio(struct
>>         cpu_user_regs *regs,
>>
>>              ASSERT(hsr.ec <http://hsr.ec> ==
>>         HSR_EC_DATA_ABORT_LOWER_EL);
>>
>>         +    /* All the instructions used on emulated MMIO region
>>         should be valid */
>>         +    if ( !dabt.valid )
>>         +    {
>>         +        gprintk(XENLOG_DEBUG, "No valid instruction syndrome
>>         for data abort\n");
>>         +        return IO_ABORT;
>>         +    }
>>         +
>>              handler = find_mmio_handler(v->domain, info.gpa);
>>              if ( !handler )
>>              {
>>         @@ -121,10 +128,6 @@ enum io_state try_handle_mmio(struct
>>         cpu_user_regs *regs,
>>                  return rc;
>>              }
>>
>>         -    /* All the instructions used on emulated MMIO region
>>         should be valid */
>>         -    if ( !dabt.valid )
>>         -        return IO_ABORT;
>>         -
>>              /*
>>               * Erratum 766422: Thumb store translation fault to
>>         Hypervisor may
>>               * not have correct HSR Rt value.
>>         -- 
>>         2.17
>>

