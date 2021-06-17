Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F263AB6E3
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 17:06:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144048.265213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lttaa-0005Fg-PE; Thu, 17 Jun 2021 15:05:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144048.265213; Thu, 17 Jun 2021 15:05:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lttaa-0005DT-Lx; Thu, 17 Jun 2021 15:05:52 +0000
Received: by outflank-mailman (input) for mailman id 144048;
 Thu, 17 Jun 2021 15:05:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/zva=LL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lttaY-0005DN-WA
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 15:05:51 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb629e21-575a-421f-b169-cbbf5c3b5d97;
 Thu, 17 Jun 2021 15:05:50 +0000 (UTC)
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
X-Inumbo-ID: cb629e21-575a-421f-b169-cbbf5c3b5d97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623942349;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=U5FFEfAtlZJtGKz0DiWNGtX7DqgnvsRFaAZYCpDWLK4=;
  b=di0X+WE8Yc5VrnsXbP3/QrHEPreiIX0TkgIjbTtBvFOMZyYN8aAQDT26
   UAlJqdpLfl5fObr5UCobF8Q/qRoxtjHVvcKqWuGCZrVKQdLTQYAVx+Oo1
   vFgQQwJnhyCr8gynZDJwYQOHWPeYKfZvQ81U5enMP9z77dZM/UE7OTzrw
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: N8HeADVp33NOeudm9wHdgJXetfUPD9CvEKSLPB8IuI0xXfUdMDf514AnbC/sLtFyMjF158o8kd
 U51tRiMXsTPCvNhHbBCsdEglvsHdgBSYSnOIX7WgNtRIEyfYogSYgILWsiGO0h3+8jqr0J5m17
 /PPpq1nRBGEyXBaEzsw/josWyijWhuJQncZkrdibYG6btCxHCf/D18txHLUAxIlMdS6Fqo7CQO
 haX5/KPItAMWv59Od508uhVhhmazFponJrBTw0ex3U8ZL4ZREs7qAt35YB0MVkW2nvPTMjBRhC
 mzk=
X-SBRS: 5.1
X-MesageID: 46363019
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:9vKQYqpvmHPs6fMgdE3r2VkaV5vGL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossREb+expOMG7MBfhHO1OkPcs1NCZLXbbUQqTXf1fBO7ZogEIdBeOjdK1uZ
 0QFZSWTeeAcGSS7vyKkjVQcexQuOVvmZrA7Yy1ogYPPGMaH52IrT0JbTpzencGNzWubqBJba
 Z0iPA3wgZINU5nFPhSURI+Lpj+TpDw5d3bSC9DIyRixBiFjDuu5rK/Ox+E3i0GWzcK5bs562
 DKnyHw+63m6piAu17h/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtQIh6QbWNsB08venqwlc3l9
 vnpQsmIq1Imj3sV1DwhSGo9xjr0T4o5XOn40Sfm2HfrcvwQy9/I9ZdhKpCGyGpqXYIjZVZ6u
 ZmzmiZv51YAVfrhyLm/eXFUBlsiw6dvWciq+gOlHZSOLFuK4O5lbZvuH+9La1wWx4TsOscYa
 9T5YDnlbZrmGqhHjXkVjIF+q30YpxbdS32N3TruaSuonJrdT5CvhMlLfck7wE9HaQGOtJ5Dt
 T/Q9NVfY51P4YrhIJGdao8qJiMeyDwqSylChPbHb2xLtB3B5uKke+t3IkI
X-IronPort-AV: E=Sophos;i="5.83,280,1616472000"; 
   d="scan'208";a="46363019"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OeGILgEEvkbGw7CNmH5QX3ASpQt/AvwWwPIM93ASxxKDRMKkCcex+4XyxEoNN0UmA+QWmfrzk7/UVSIz3NGgZOnq4RClL3+FtPaDSP3GdTGAd3QpYI3t5xZFP/WJjPHbzP3ANtvsGK6ecfdL0xEP9bWrP4ID5nNyLbbnVJiwADdeMCXrx2LwCwodG9M+G4DI70ITzmEw2WhqA/xagyopPFFNpRByH1Q/kXnsGCnLohF4fIorDxBkWvIRYV9Z0Iz948NUJQdHtmjvYB6xYV+3eI8941zZQ3uLPGuWq6i/Ttb4uF1zD+n+brC/bydL/Wf7cSlv2znhnunn/0aGeEBebg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5FFEfAtlZJtGKz0DiWNGtX7DqgnvsRFaAZYCpDWLK4=;
 b=ZP/TGDCYPfPyjZvAqdZc1z+06TYqUI+d3TJdMhcSozOrp8YlExRGoUKVgLixCqTOjAEizbnR6822t/2ZbaWvF8o3n+rdjbgGwbZVRFEqh8wE2CYUfgqyv77HIEgr1MW8Mn21lOg36sjCvBOH61ksGhwbIt468ok+faH0RyJfYi29gFoodH5JomzkTyrogTYLxPnlC/99xUks//jZ+ljtbLwvwcKq0QcRNMp/FWc3vNU6OaS7lXPXGKpnHRPq29lSAFxI8N4SqHezfUPGkhmQg68uFg1ZJrLrc1tULK/pHMpxcXV5RFGD3uGL6wkfBjT5DcwMpTq6LbhTfB7zjkkJQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5FFEfAtlZJtGKz0DiWNGtX7DqgnvsRFaAZYCpDWLK4=;
 b=ohKXULnQkSZwXSz6cD6aKUoIcNNkvKjpP6D63xF4vzKZQ8saxHcpT1dhGOfFJRR3tYv/GshGGFa8ZsWro5OM//AbPmx10ruRlvAE0dGYUlJvNjYmzqLdVGrwXlirbFyKYyMfJRJ9I93ptd4WACwdbs12d6odQq1l6awB3/tdAYE=
To: Olaf Hering <olaf@aepfle.de>
CC: <xen-devel@lists.xenproject.org>
References: <20210616125129.26563-1-olaf@aepfle.de>
 <968713af-3c99-3fe3-8378-9d9c3985098e@citrix.com>
 <20210616173831.5e8214bc.olaf@aepfle.de>
 <861fbbdf-f3a6-ae1e-9487-b3ca37b30ca8@citrix.com>
 <20210617165540.4bf22cc9.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v20210616 00/36] leftover from 2020
Message-ID: <93cb2906-6c39-a5df-c173-03a0ce7e113e@citrix.com>
Date: Thu, 17 Jun 2021 16:05:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210617165540.4bf22cc9.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0036.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::24) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec42e744-19ea-44a0-edcb-08d931a161e4
X-MS-TrafficTypeDiagnostic: BYAPR03MB3863:
X-Microsoft-Antispam-PRVS: <BYAPR03MB38631815CEEFA6CC9119CA3ABA0E9@BYAPR03MB3863.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4HJhRs6O+TOWEL7egABu7X81lV4LMWrRtcyynuYTIS+siEGSWpyQtteeXf0qmhv0/lhk0wnOMzaxTXagVRNbogocm34fLSUHIytX+bDj3sgW3yPkrZFacjP7MNnHhG4D+OLWdHIvQL/XyFWdVArPF6yxi6aZQE4dtotQnvqbcOd6nC5Tux0OQTWwL/yN3U8TEn+Ai6Elq/EPFRkOZfDtBCXE/fFMBqeS4A0yhTh+8zf7raPlKtzC4JlYykjGPypppm1L6ypeRb7NsprrpVqWb4APq07HeX3J4b4RPHiThpd/+zUh7qo4YcEBeCoi8hS3nxiSPLvfYnqqJRAcwLknEQJ0kl4nQo1A8vJWArSv6rBpOGUoIrjA40qi9sqczKvL7zPl0UMXT+4vNaldHD1I+xxKHeilAet6SU4Q5khkeuJCc+hdlmf9nJr7Tam1+3W8w8LNKPiQSyI/Rb9C5L8lnFVltWpYneo2y/5XAuJxdbfDr7n936/2TCPMWzSOuJ8uQoJL925bSL9ctF1ERdqyYxXXx7lbzP5WLhArx0RFVlshV/YUPPWsXR946yS/Xmx2Ypx7zc0elJdyfb7xCndSv5ublBOzreDBdHPGq2Rz60+yEn1eHqjYuWvbjbZwtpvGkoMHRKI6CVKHnpNM8YKLj9+hTFyk+JR40+MrNZ0Qqhl83MmCEehZSOgAUfQk+fjP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(83380400001)(5660300002)(38100700002)(6916009)(2906002)(66476007)(16576012)(66556008)(316002)(26005)(66946007)(6486002)(8936002)(4326008)(86362001)(31696002)(8676002)(4744005)(16526019)(53546011)(6666004)(478600001)(36756003)(186003)(31686004)(956004)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?jGVTaIuyyyhD3svRMw8U78YankSdETGcdRzql2BSlZXzwL+di8WG2ump?=
 =?Windows-1252?Q?wgIy9FzL/E+ooJe/QrjEt9ev/URN6kKSWlN64pbpKSxqsToXF7DmoeAt?=
 =?Windows-1252?Q?/qNTGIHVbfAPXRbchbDmPDZlPilqGVfbYNJsrtFFaS0DqD0Vv6VbweNR?=
 =?Windows-1252?Q?6u8v5VAE7g3Kk81DN5OECQFE0PqaE9BAORDRLc8WBpxwGuYxczKNGwGC?=
 =?Windows-1252?Q?SBDuj5tosiRMYX+PAJRWvXL8bD3I+dY/+azbTwWFmfStp5x74prnb0P+?=
 =?Windows-1252?Q?KM9bpdLInV1lPZrCOAw1PmkeMBfHK32mVKc0SZpsDX+Q9fmfKPUkt7fd?=
 =?Windows-1252?Q?fnPjsHQqM8cXLmNhJ8bB/SQosPU/M9CS31dsLyT+P8DQMVCY8gRE9lER?=
 =?Windows-1252?Q?LZQ8P5TJjKqM3VVAZM99lVPUqsqpBvQPD7rvUxanuUVwvE+2x//zrCey?=
 =?Windows-1252?Q?vXZzbD0l32LHRGvcfjfyYmvJyg4D7Ik9/iw8Mp/+5Tv+JYa1fn41U3bP?=
 =?Windows-1252?Q?o9ZLT9GXYXLdoFYOR0WRGtIQWXaXW2jJSaQ++eliCnEFD8hzJ+1/5HFm?=
 =?Windows-1252?Q?z630zS6+ov0mjsKzEVIhWarAn74x83t+6L84bB4sf2nVKze9KnIPHJe2?=
 =?Windows-1252?Q?ZZoGdp/ON1YVmlfM1d/lTrHHf7+hX8G8yo4rGs/mRI2mobEYxLSlbFr/?=
 =?Windows-1252?Q?eqhgXynXa05M/RapgPaPCqgMCrUVT1a8SeVoSPo4E0h9TpLWIOIdhfJn?=
 =?Windows-1252?Q?fN+9i5HKQp5fKdtZnlcq4tQ3YkMmbqyQ/5SrFbYOT4E/DvkRyIHzMRr2?=
 =?Windows-1252?Q?KtqLIvwar+Y3lI3/7AL95RPHEX0qasL336DYokWGGEH8PbrVbORyl07u?=
 =?Windows-1252?Q?FnItcM2tAI1GnilaIS9eC1aSeoK3zWwODveG5E9WdRhJdBR3lI0NjGy6?=
 =?Windows-1252?Q?rRPzvuDHq+GCezeW46F/pcG+GLw+OZ13gMcdQH/vnwl2PR5Nqkq0Ab2z?=
 =?Windows-1252?Q?thjSamPQahlER5P5kfJcQbsEKsUbL6CGjtrL7yvJUxJDldRPSVPn1rkQ?=
 =?Windows-1252?Q?tzTaZAGlyHDlJYCvQZSnhXaRFIRBQ8u+z5oaK6XLLU5v7H+Auh+36Ss/?=
 =?Windows-1252?Q?3vSrEKjblnDrvPoDYWk7kcjs46C0xBLkw21l2OMmmxKzYglbDXsO1zLl?=
 =?Windows-1252?Q?ibZfeSXXdQytMDKPZg1SCb/RYqrAIvq9XKP3sQdsjerijx9xcbo6Zydf?=
 =?Windows-1252?Q?WBjERlsXIN5Hanl0NIVCTfacicOgOMawTnb5301Ghar+X1xSQI3sU0UL?=
 =?Windows-1252?Q?KvosCIs1kxH0SWHlF/IaAZunTBoGRzx6egkFP919zpQ0LhZeN6uD39NT?=
 =?Windows-1252?Q?H6XI2rnugNXtav+3z0v9adLx31rxZpUn5ZtDHLWpTHcFgBXI6ba3QvIb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec42e744-19ea-44a0-edcb-08d931a161e4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 15:05:45.3473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HbtT6qkdkSqDovTnaiAXblNr4vXdGFZPYfVLrc8gCutiA09pcCby6M9qp4as0TDiG37/e29fgp9EamqrrJq/W9BdXEkTPg4DwFraP0SBnmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3863
X-OriginatorOrg: citrix.com

On 17/06/2021 15:55, Olaf Hering wrote:
> Am Thu, 17 Jun 2021 12:24:22 +0100
> schrieb Andrew Cooper <andrew.cooper3@citrix.com>:
>
>> On 16/06/2021 16:38, Olaf Hering wrote:
>>> Am Wed, 16 Jun 2021 15:50:24 +0100
>>> schrieb Andrew Cooper <andrew.cooper3@citrix.com>:
>>> =20
>>>> 32bit toolstack build =20
>>> as in i386?
>>> How is this used in practice? =20
>> Every OSSTest run.
> This is not what I mean.
> I think there is a 32bit xen-tools, a 32bit dom0 kernel and a 64bit Xen?

Yes - this exists.

> Is 32bit xen-tools, 64bit dom0 kernel and 64bit Xen expected to work?

In an ideal world, yes.=A0 In reality, no.

Lots of hypercalls have embedded pointers (every GUEST_HANDLE(), to a
first approximation), and dom0's ABI with Xen is 64bit, which is not the
ABI that 32bit userspace speaks.

This is one of many errors in the hypercall design intending to be
addressed by the ABIv2 plans.

~Andrew


