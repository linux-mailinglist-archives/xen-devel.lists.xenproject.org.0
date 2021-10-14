Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1F842D657
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 11:44:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209205.365590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maxHW-0005uw-3g; Thu, 14 Oct 2021 09:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209205.365590; Thu, 14 Oct 2021 09:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maxHW-0005t9-0W; Thu, 14 Oct 2021 09:44:10 +0000
Received: by outflank-mailman (input) for mailman id 209205;
 Thu, 14 Oct 2021 09:44:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xl23=PC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1maxHV-0005t3-0b
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 09:44:09 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce8b989a-b8b6-4ba9-a94b-cf906ac11810;
 Thu, 14 Oct 2021 09:44:07 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2056.outbound.protection.outlook.com [104.47.2.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-0qWV6ImgOWSfkH08245eoA-1; Thu, 14 Oct 2021 11:44:05 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4606.eurprd04.prod.outlook.com (2603:10a6:803:70::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21; Thu, 14 Oct
 2021 09:44:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 09:44:03 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0088.eurprd06.prod.outlook.com (2603:10a6:20b:464::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Thu, 14 Oct 2021 09:44:02 +0000
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
X-Inumbo-ID: ce8b989a-b8b6-4ba9-a94b-cf906ac11810
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634204647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MTirFEo+vHGxZZn50utoGMoRAfbsSSvVAfED9B9MsZo=;
	b=APuqMmvjupbGzXebek6uMH+eiZkP2LP752VJmFJr/z//tSbVjYMWgmvp7U2x53jioDo2Uh
	78wIRp5Nd9r8ynGok/s4pOBDMwl/pNr2w6uEyLhpKST83vAXeQu9I27b5JQ80QXU2h1ZQx
	SCTXuBcCGAx1YiyUQyCN+kDZ6w2I7vE=
X-MC-Unique: 0qWV6ImgOWSfkH08245eoA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mVMyuVT/fHsPGlf+sGLMLYcVn52ONQ+Ih4nD7JZm5gGeEiPHe9O5zK6oSoCdg/OLHJpjNRGQXMn1L58qKx3TvrqwqZP5j0zadAqal3boOKAGwH+A1JvOmvPA3hjmZWCTkldgw+ED6BxBq2IN0tA3kOAXukbpM1yS3T+UKCemMdrnb7vMzIKfQuAzDCmgBmiqQ16/Rtn3EXpecLKcMIlqyxcQoYVGKo16DAtwgBA0PmQxxNfnR+ppjOzeP6k3AYRU9BfZYYL1WXcXLXSns6qexWtp8CkGzZEgp/CjhvldgnGnAFsBdPVavwneMxJW04otEl2X87jV0Tyk0hpto3D87w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTirFEo+vHGxZZn50utoGMoRAfbsSSvVAfED9B9MsZo=;
 b=Q6Pm27ckF2y2U2HkcZ5oDr7ljEAHga2qnMukriIg/XRYpBGBmStxYAnhqcHSqY7HN8SF5ZNOAYM3MKMUyCTBJM+TD+98P8ZDbNRDdln9+Q2yBIVUqFouQS8VfY6drvSLy8zfYCd2lDg9OT50/6RTSU45QNwni0xJI26IDfH8BJBnQ8gRKvq/zLuRELZhgGklPQu5ujV2yMtBmKNmXGx9rQxWWH0IwrEpahuE38bwg2q4k2Q6AFF4MBvzTsPWj5dt+vjr7MuH7Iyc/d1XJW+H7M1NYyHPUrVvk2eyCgpR5nK8E8Ko0pfso3uA/7U8NKDACPqaOnMtpqDp2t3CaVdCfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 47/51] build: Rework "clean" to clean from the root
 dir
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-48-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f29750b5-7028-3ec5-5bef-4c4480032a18@suse.com>
Date: Thu, 14 Oct 2021 11:44:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-48-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0088.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1efb58f7-9f1c-40b6-d546-08d98ef72857
X-MS-TrafficTypeDiagnostic: VI1PR04MB4606:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4606D80591BFF8C3C328283DB3B89@VI1PR04MB4606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	befVZ2yBHwcJcMY/QYiptxru13u2+0MWSyPvHhcD56uvvm5PXmOlzC444U+zgZvOolJs3nG0hYJ+UDqX7k+1GnJo9HYGB3SuqK3IvX4nE4Lg8xZ4ns94G1ms8N6GoOKSMYIeLXmtv7wseHq3g0HaSL+Tv1WEszr02oQd8SvzKxgEThZnLQmicTODAFEJuMvTtJng7WRWcxaDIKYXQCmWFtZy7BixtP/iZT0qX9bcpsfcVPucAB0kvwkU+JfMjt1R765U0/iwGxQxvmHYqQi3q7PZW2cWlAacunWSGr+xohMXTZalucGcxyCbDQxmbpJKzT4feX2tVxiVZEmq8gfGUhxkw9ZTnM5OI1XtqTGmiI9j1TerulShDPDiH9itH82UzyMoLn+3a40pG/FqnXwF4/WNbWJziTdUoNxjA4xcTRdf2nIFPHfBjKATJDOYxi/qjCHBLDJQNXfDE13akStMd7R5PHdDCnFDo0jH2CfftBqdpJm/TTv/kJ44efjoB5Fo9yQ4oob4cJoVlhS1crFtCkBBvYOB80hMYnU2Z1894xODrU1zGjx2gHUAtgIv1PL4vmu11qMxtyF9knSeC4cPP0PhCZtJYmrbuS592GYb0JUvvIRl7hPARvAEa2Csx2POJUssqZq5AqFMQ0mtcXGAXHD+Zqt3D9xEq5UuA/wfdfeaf6wHu33SzpW7yU3dhlIjnqL0j3G3v2Uoj6am1p++76KXXjFBnTcMU+JsRvI7+EA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(66556008)(6486002)(2906002)(38100700002)(53546011)(7416002)(956004)(54906003)(4744005)(6916009)(8676002)(26005)(186003)(31696002)(16576012)(86362001)(4326008)(36756003)(508600001)(66946007)(31686004)(8936002)(2616005)(5660300002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGhUV2VvVklaTTB6N2c1bVZCblJ1cy84UXAwR2pEUnBiOGNqTEs2TGsrcDJK?=
 =?utf-8?B?RUwxSEtNSFQ3RmtSUzV6blpwUDg5eStiYnk5K1lxNjlzMW4ydThXTmQrTGpX?=
 =?utf-8?B?UjArY2Y3RTZjbkk0b1U4Y045QlREQjNCMUt4QXBVWkRES1JpYnJpaWMreE83?=
 =?utf-8?B?UlI0UWxXVmRrTS91ZjBmcW5abWkvVzFseHBsL29DR0h5M0FlTTE5SjdJaGxl?=
 =?utf-8?B?aWx4MVpTUDFTdk15S1VWdTBLZFFpd3p6a1JqYk9LdzJqbllIWWFSbW1rb3lU?=
 =?utf-8?B?eVFxVUNZcTcva2tiejg0YmtDYy9xRnFma0dCTStlVHpvRG5UNDNHck5BUTMy?=
 =?utf-8?B?MTRoVGdma1FQcGM3aDR0Yld4bUVoVTRTWDQ1cUpkMk1qWjJXSTUxdGlrU1Bu?=
 =?utf-8?B?b0RUNlVwblEzS0htcEFDUC9Bd2VNaUU1RVNaNTdIVno4RkVJM3VwbElPRGJr?=
 =?utf-8?B?dWF0TVVLTUw1T2pSWS9XeDJxNzVFNXdyNE5xNWdxTmYrbzJMRzEyV0lkbmxw?=
 =?utf-8?B?UVZFSlE0aWVtTVBxUXNWZkw0TXR0L0xXN1hkSGtjRWcvTVVVY0xHcWNQdUJD?=
 =?utf-8?B?SlhwQlhlcnJGTDU3YTlQT1JlNFlPUlRDeUU0NVhSbDZnTys5Y043L2NWMUdi?=
 =?utf-8?B?L1FOcHF0anlsQXg5d29yd0dadDg1aldWY0tJVjJQYTZBSnhkU3NNRitaZUxm?=
 =?utf-8?B?YTF3dm1DRnl0bEl5Ulllei9qRmM3cnhTOHEzbGFEVUxKZ0VQMGt3VmNKclRw?=
 =?utf-8?B?M3dvNVBENm9Sc0k5MFIydG1wdFJFaHlneEdaWjliUS9KRU9pVUJtUmhLOGVr?=
 =?utf-8?B?OGtFU285cHdqN2hOdHU2YjRkbXRaVXFRYXVyZENiS3I4NHRmOEVYY2ROeU43?=
 =?utf-8?B?cE1BWjVNYTIrR2RaTjFHMVNwYXBwWXg0alV4SnNRY3kra2NOazUxOHZpL3la?=
 =?utf-8?B?a0hFU09YVnVmY2tVWFVQV2RJRUgzc0RiT0h1T1VqSkhsa2c0OUEvMVl1VC9u?=
 =?utf-8?B?bm9SS3ZwdW9oQVBGcXdjd2lScUl5MUF1WWl3RnN3U3BBU2VBQU1yVm8zYmhn?=
 =?utf-8?B?a1FvNGFJTzg4YkhPK2JGTzVSeHoram05SGQ3UFIvU1NsUEo3SnhOMFpzWkQz?=
 =?utf-8?B?bkcrMXFyVDg3NHczT21nOWZ3Q2lQcXlKL3dxYSt6VHkzQ2s1UnZsRWhiMmt2?=
 =?utf-8?B?aXBCcGhteWs1QlByd0NCN3Qyd0VJSmpIcHdnSkZvNlV0dGRzdjZUMUhXd2Vs?=
 =?utf-8?B?TTA0RkpJS2lkNlVEVjF4NFJGcW5Pck95dzJYSERSRUk3TXBoWTM2M0VKRzlx?=
 =?utf-8?B?dWExNVFWSWYybTRYWkVDZ1VWYjU2MFNxdXNqaDRKZE9mYVFIUGN1OGJQc2lY?=
 =?utf-8?B?bnBOazV3cCtpVkhLZzQxVEtnRTRBQStrV0Y4cGxCcGR2WGIwUUFsWFFxN1Iv?=
 =?utf-8?B?M1NGV0dnck1YZTJPbUVLR0MzNjVXYm80NTd1ZTY0UGI2dStLTzc4c3E5NG0r?=
 =?utf-8?B?MGh3UU9wNFhMRTQzQTZyUlVwT25CbW1NamFGZ2I0Zy9VaThiMnFUV3JXa002?=
 =?utf-8?B?cXNLNUFPVVMvaGw3ajZJbHIvQU8wRVh2dXowdU5vVkhJUjJSM2NCcnpYRkc3?=
 =?utf-8?B?Q2FueWdjd2lGTkEwRE1vc0oxUnpEbk8yTEFIL09raU5UK09xNzd4SVNwckxF?=
 =?utf-8?B?UkZYSjlpQ1hvVkJjazRTWHl6Z3NUWFZmZHRmL01tVm0zWnZJaXordDhrRVhL?=
 =?utf-8?Q?2nQK+6TZvNZugFcOUZ++AVHy1+MWDtCKIVYBQjB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1efb58f7-9f1c-40b6-d546-08d98ef72857
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 09:44:03.5556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nnO6+l4+fapuWRP+UsAE7JBPlY3sQBqLXVIlkqV3z9dc4pVBGXitn6589KRECeVEAstsL/bZQtYXz6wSCyK/sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4606

On 24.08.2021 12:50, Anthony PERARD wrote:
> This will allow "clean" to work from an out-of-tree build when
> it will be available.
> 
> Some of the file been removed in current "clean" target aren't added
> to $(clean-files) because they are already listed in $(extra-) or
> $(extra-y).
> 
> Also clean files in "arch/x86/boot" from that directory by allowing
> "clean" to descend into the subdir by adding "boot" into $(subdir-).

"descend into" (also used in a respective comment) looks contrary to
doing everything from the root now, at least to me.

> --- a/xen/scripts/Kbuild.include
> +++ b/xen/scripts/Kbuild.include
> @@ -98,7 +98,7 @@ build := -f $(srctree)/Rules.mk obj
>  # Shorthand for $(MAKE) clean
>  # Usage:
>  # $(MAKE) $(clean) dir
> -clean := -f $(abs_srctree)/scripts/Makefile.clean clean -C
> +clean := -f $(srctree)/scripts/Makefile.clean obj

Doesn't the comment want changing as well?

Jan


