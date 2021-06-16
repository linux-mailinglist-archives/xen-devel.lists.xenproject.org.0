Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8D23A9B0F
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 14:51:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142932.263566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV11-0006Vy-6j; Wed, 16 Jun 2021 12:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142932.263566; Wed, 16 Jun 2021 12:51:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV11-0006Ta-3d; Wed, 16 Jun 2021 12:51:31 +0000
Received: by outflank-mailman (input) for mailman id 142932;
 Wed, 16 Jun 2021 12:51:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vOo1=LK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ltV10-0006TU-41
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 12:51:30 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3455a608-2e4b-4d91-9e3a-95f5a5e1aacc;
 Wed, 16 Jun 2021 12:51:29 +0000 (UTC)
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
X-Inumbo-ID: 3455a608-2e4b-4d91-9e3a-95f5a5e1aacc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623847889;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DWEAnpv/NQlwUw+QpENGwlmp+K0qmMQIa0yQLbbWvc4=;
  b=DqKltO6cG42swTJtvJJXPFG24gz0KJxd+zmOO6sC9BCeE8Z0DAahRCSx
   zCUOcbEHAeqESL4OudAPIMeqTIdcojLU5qcVYUZrI2IAw1yZ3qyR7WKvE
   MtIT93Td00uMkxLwXzbM8PUde7wHhNo2TB3eRRxichDBEGh65cpnCCoqR
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Ztvxs88uqQKrMjniIQkxPhj/MvEqxmHWl6jBwuLpeCcePeXOL+1veOrHzfS3HlZI3rIsqx+VoB
 VKu8fsMOJBjWg5QrcT8rjVoBHaGzidjQaa1VC6W8qCfjIKjfj+87BPLKcjxlhY7C5wZLJGbU2W
 b2gHa6X/y2/3dYLz4Qcp5cBf713R8oVXjT0onWOf8qsV8gPA9hgwcx0cypteFoP0h9zTX4pkRo
 /PwOsHcqSyFp6qBQYde1Js/hRNjPM5zyY3JsFyO4vI2jeEH8Go/60VbCoztPL9Civo6/0A9QQn
 itY=
X-SBRS: 5.1
X-MesageID: 46626772
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:4Cfgv65CRQlBzaRaZAPXwViBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qADnhORICOgqTPqftWzd1FdAQ7sSircKrweAJ8S6zJ8k6U
 4CSdkzNDSTNykdsS+S2mDRfLgdKZu8gdmVbIzlvhVQpHRRGsVdBnBCe2Om+yNNJDVuNN4cLt
 6x98BHrz2vdTA8dcKgHEQIWODFupniiI/mSQRuPW9o1CC+yReTrJLqGRmR2RkTFxlVx605zG
 TDmwvloo2+rvCAzAPG3WO71eUWpDKh8KoCOCW/sLlWFtzesHfsWG2nYczHgNkBmpDt1L/tqq
 iKn/5vBbU015qbRBDJnfKk4Xid7N9p0Q6s9bbQuwqdneXpAD09EMZPnoRfb1/Q7Fchpsh11O
 ZR03uerIc/N2KJoM3R3am/a/hRrDv8nZPiq59ns1VPFY8FLLNBp40W+01YVJ8GASLh8YgiVO
 1jFtvV6vpaeU6TKymxhBgk/PW8GnAoWhuWSEkLvcKYlzBQgXBi1kMdgMgShG0J+p4xQ4RNo+
 7ELqNrnrdTSdJ+V9M3OA7Ae7rBNoXpe2O/DIu/GyWWKEg3AQO4l3es2sRF2AiDQu168HIdou
 W+bG9l
X-IronPort-AV: E=Sophos;i="5.83,278,1616472000"; 
   d="scan'208";a="46626772"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ED9eCKfnovD1BHLiwJ6UVo9PxzMflz869q9jrQtBe0iKWZ3ai8u/2oJMaLQFMZOG5AfOKUs14cbPXBlw0aWc3f3Rj1OFdae8MRhncDwmEeYDZF8nfluzRr6Je61G7iZVrENAbmdPhzy3uoK9IzhCPERYfqQI7AJZ6yrOq07cSl+F69pir5iDfXOgWawS5yhyaVNHZsSZS7OSOfsZzaTu9Ziy+fj0dbPmwbWG5df922tMVwnmpDXXu/XM5TLRjGE4JUYoZVqa9Vw45DqIs4xLHhgB5ylsKvQUPlSvZXPMFmbpLeYn/3TKBGnPRgMndEYg/R3pcMs2ioJKZSP2dWxjUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bL1/xi8M78gk7WGmiYauEb85Z9lHkvAkyZCdZIgmTnw=;
 b=bkRW7lDS8ogRTyuVx7Ak2GzLfjGfo7zeWtehvTXzb8EfMYcygboK5icegTw6QBRGalYt/eOjqq21iqzCtYg5tg5cDV/XxwimTSECC6DsbJj1jnia5eukJ5j4O0QxCgkE9zAlviYG9FBkZh01oKi0agCVT9rdHC3XyU9BxdIVXYcEmqajK7nE+QJxJVJcfg0PDLX0clBbHWlEvFGdL6MKuNnjBPBbvrSGXplgEvLc16qn2usbxDrcyx83uzXeiKR4h44uxq9t7YHJG/Wcnnet0s4mv4Y9QusHU8MDHTYmnG+gxSNi66IF983adKqBCQNheDsHe9fzUBoEYoY+ZydMBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bL1/xi8M78gk7WGmiYauEb85Z9lHkvAkyZCdZIgmTnw=;
 b=PRmPZvNKWm5ZLsmqIXcg6FkZFsFkspcbWJDfOrfr3+WXkP4/ACYcMDM0S3oA1C68msPAJvL8WsQ34zPSy/jztH4U9Zo9cFbpDtkG95T7Oh7SHV2nccbr7s2aTW1fY5O5KpnCais5p/TemGeR0cgqjUofdZ9aE6jaMwMfVC5Tx+A=
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Juergen Gross
	<jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210615161905.9831-1-andrew.cooper3@citrix.com>
 <20210615161905.9831-2-andrew.cooper3@citrix.com>
 <04f641e6-04bd-8884-4b08-4c8f9a418b0b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/5] tools/tests: Drop obsolete mce-test infrastructure
Message-ID: <ba55ec10-73f0-8e1f-f0a5-6fb9a1155515@citrix.com>
Date: Wed, 16 Jun 2021 13:51:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <04f641e6-04bd-8884-4b08-4c8f9a418b0b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO3P265CA0003.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90cc1049-5215-49ec-7d72-08d930c571e7
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5885:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB588556B2B1AC995BC182530ABA0F9@SJ0PR03MB5885.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RkbyAdKD/tx/ozxVXupffFx9w3D7WLHCGYTHj53fwzuUQbQa6s8uqS6raE9Cl7U4nK/lxK/uEw5vXhxknyK0qD8LW08N8pJXPDPh+XdMnk4L5/mWzz5AK7ekwpgESivCH+GeLlT9RCZMe2LohnQXXwX0lAexwnioWBs8/xjn+BUx5nnexIaNTN/uKxlthUJnhgYwFWST5KQWUNxWIHDs9bmeIjoOXNj3j1mrSi6zr3Zy/kIcB7JDN+LEdiYo4ObOO0dXBz30rtgoL4D3vP7X2Yxn2vN0T44XSP5HLmxNHJ2tvCa4CsVfyl2YD81lIqt++1fDjPd/73hjSQbig8DNDrDs24Kz0JX7G+96GrY62trdnaLrOKcAbvriDPYUkXybTbCDESIT8V4eME1k8bpdCt/XhxraTZzILYenHumiUZqIVKGaxv2LfuHdfvtN59sfTy/x3o0sqK02VlBM/sZfTOczrqM6aiModuO/i0ntJ7r+ZyCeorAcjzq1WDKDY98BCmsBgpiGr1j9Pd0hAFvjBOAkFjRjmtK5aLHudpSOZ/67dmTH3OhNZEc1ONpRWUjY8vyQPsn60VG3nhmODsQXTj9b1ieMLTXUaCOJcmEn/9ik0Q1hxA8YmaarEQFS1wyTgvnPkFJ5f64u4nWuQRh0F24u0R2a5xHRbJSEnDmeQPrtfs6Ts9QKKI1xMKjDUe66
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(366004)(376002)(396003)(4326008)(2616005)(66946007)(26005)(54906003)(8936002)(6916009)(316002)(31696002)(66556008)(66476007)(186003)(478600001)(16526019)(86362001)(16576012)(2906002)(5660300002)(53546011)(956004)(36756003)(6666004)(8676002)(6486002)(31686004)(4744005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1E3ZUU2amY0OWxVaWUzMStzd3c2SWNtV3V2WmNWa1kyNTFhMjFhdG1wZHlL?=
 =?utf-8?B?a1BhRGNmVWs3MXluMlluTmcyMlM1bzk3U2NnbzdLRVF2WHcrRW5vTFJUeGI2?=
 =?utf-8?B?U3p1VHpqVWF5d0d4WCtvNUV0Snk3dE8xOWhWblJscUVONlk1ZmFFK0ptS1Vx?=
 =?utf-8?B?bFRCV29tUzR6UjZUeDRQSzZWNTBqdHN1d3laWWZZM0VzVjErWXRtZVo0b2pX?=
 =?utf-8?B?ejgyKzhBUHR4cFFPT2t6V3RGSFUxUjVCcHQxL0U1cTA5SGtyUUVJTE1SOHVj?=
 =?utf-8?B?OUo3VGdVUzZsRElwZnBTaWJ1VGkvbUYxSXJveDJhTUlWKzlaN0o0aTdONTc1?=
 =?utf-8?B?ckNsVkN3Y0lJMEtZV1BCVW9PTFdYcVFQbk1WSzJmdFF2eWhmVTBQNTJCaldY?=
 =?utf-8?B?ajN3S1NucVFWZmFFVzljSlRIUnNmaHkyUkJaODQ5WjJkNllQTHBQOXdUY2Uv?=
 =?utf-8?B?ZGhRTy85TWpoYkwvU0U4UzRWUWU1QVBmUit3L0Y0TjE1ZWN2Tm45aSthQ0pa?=
 =?utf-8?B?YWNLS2MzYWoxSmRYN3h1S1VHTVZmMzRiYnh1T0FIRUhYQXFkc1FhYWNtR3BY?=
 =?utf-8?B?ZG5iY3Y1VlRkZ1UxK0htNmJYa3lkRTlHZXZPMENMSW1HWWlWaDVMK0pYQ1ND?=
 =?utf-8?B?cFMwdTcyZEs0OVhrd1hiaW5iWWpUa1MvZlg2UW93WWw0VmxhN3UvMFU5TUMv?=
 =?utf-8?B?UEl5TzlIbDZJNEZrejJhYUVSc0N1cEFFd3ErSVpzcFkyNVRTNWs3WkZBWEpo?=
 =?utf-8?B?dnRxcWk4ZExXL0pnaXlRdEhxMFYrcnpMbUc0Y3V2a3F1cVJWY21LWUdSLzVS?=
 =?utf-8?B?aHJIWnQrUEladXdka0dYTVgrSDdsdk9BSnJ1bVE4S3BGakx0UTJjcDNFb2lI?=
 =?utf-8?B?SDNiTjRWTVdmUndKYWpVdzd4OHk5b2pBVzhVTlN1RFphZXBROTdNcFBkcWdv?=
 =?utf-8?B?YWhmaW5uc1ZOUnNpenJ5YlFxcDdhd2h1a1FML1lLN29wN0l4Q0NPNUFCdk9Q?=
 =?utf-8?B?eEFkV2YxWHl5Z2pvWHJLb243VVB6bW5NQndnMktvUC9xWkdIM1JVZGhSdWJF?=
 =?utf-8?B?OGZ1dE1MVnhsRERoM3RSeGRkV3c2UVBsZ3o4OWt1aTJJbDNYN2wycVhtdWV4?=
 =?utf-8?B?aFRORzNsZktLYVB4TUJOSk5vc2l3bnF6VnpZZmZEMDhzcEJKTUZ6MWJtYWNN?=
 =?utf-8?B?ekd1Z055L1VVWUtJNWw0bkJyeEg2aDgwaVU2UEY5OE05ZDZNSGhtN3NlcE0w?=
 =?utf-8?B?YUZWQXIzRko4TFpNaFdqRVFsRnRtWXJxeXNiYzFldFh0RkZGcGlQQ3pzRitI?=
 =?utf-8?B?SXBWVGxpVkpVRVdPdHVXV3VDY0xTTDVSUlFwTUNiUHhycW15Z3UyRjFkVzZC?=
 =?utf-8?B?U0RNT0R0dEQ3V3RuZTdBWnpPVXp2NVdIMkE4RGlYY3BIVVU5RjBxTS9vSjJx?=
 =?utf-8?B?aTJGN3RZSS8vRGlHS1R1NG0vSGhPZnpGSWdDc3JsTjlNMXdSOStlNGZZQWxv?=
 =?utf-8?B?ZGFrdnRha2trdWNEaWlOcm53TWtBUGVmeVMrRDFJb2NPU1FiRlB5NitKME5t?=
 =?utf-8?B?T1dJL3YxSVB5ajArZUVzckFUUTRhR2NEdlFnajJVc1hkQ2ppTkV1K2IxUE9I?=
 =?utf-8?B?aDdSUjVoN1lhdXZYY21JdGhkbEVoV3lmUW1aTzQzTWJRRU1ldzNkZVkrcXlC?=
 =?utf-8?B?ZFdTc05lZ3NRWmpmU1pTUVRGZFVnV1BrajlZMlF6aS8vM05TLzdsM1pjOHZS?=
 =?utf-8?Q?Z+teIShVFpfmJw15v1mRWbGCwKG2JptW5pE9+rf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90cc1049-5215-49ec-7d72-08d930c571e7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 12:51:22.8881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uP9GGcxIWzdwWsnddS7NHfShKT2dUay2tWKyeLXh1BeYJMsoewvC9xzENkg8eT99RiMogzLpVNKMYllvFjp2Ze0J4kJ7YOaiTdolRkekZFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5885
X-OriginatorOrg: citrix.com

On 16/06/2021 07:46, Jan Beulich wrote:
> On 15.06.2021 18:19, Andrew Cooper wrote:
>> mce-test has a test suite, but it depends on xend, needs to run in-tree,=
 and
>> requires manual setup of at least one guest, and manual parameters to pa=
ss
>> into cases.  Drop the test infrasturcture.
>>
>> Move the one useful remaining item, xen-mceinj, into misc/, fixing some =
minor
>> style issues as it goes.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> While I'm not generally in favor of dropping testing code, given the
> constraints you mention
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

Testing at this level is really in the OSSTest/XenRT realm, as it
involves coordination between guests and checking logs after the fact.=C2=
=A0
However, the need to pass raw addresses around to make any of it work in
the first place make this manual in practice.

~Andrew


