Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D8174978D
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 10:35:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559786.875098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHKRc-0006yE-UU; Thu, 06 Jul 2023 08:34:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559786.875098; Thu, 06 Jul 2023 08:34:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHKRc-0006uw-RL; Thu, 06 Jul 2023 08:34:32 +0000
Received: by outflank-mailman (input) for mailman id 559786;
 Thu, 06 Jul 2023 08:34:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHKRb-0006uq-6k
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 08:34:31 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062b.outbound.protection.outlook.com
 [2a01:111:f400:fe16::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec36303c-1bd7-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 10:34:29 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7484.eurprd04.prod.outlook.com (2603:10a6:102:8d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 08:34:26 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 08:34:26 +0000
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
X-Inumbo-ID: ec36303c-1bd7-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=htPfyuXSQvh2yhZRXeqPAxaGer0VuqIOV/S/EqE522NtiL/xvgwScWOllecDWCrXoS46slUsO7nnGtgLvrYKycXHkeKgGG9k2tIrIqdwTYX9bosaIUBuYdBGnx7FoATHnDaQwIXPtku9AApCb3Q/etYDShumMNO2MvBphS15uRWu+JdFb+QQaPPtnrL8qnvwF0s7xCODUZ9XjD2Bxr8UKiUlIiq8vmI/uUN2zKRigkSWNNpud5c9ZGkY6i5Bd6bueZQCpLdTjxH8NoJbtGJJy1PciZo6UNHsnL00kdr8BGkkBJEoFIwIHxxewWWvpp5nCL+TgG+35mz2RlWPhEjtWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+NOxynQXX1tQdQGDdvVqQcs6GJKWsm6hgQHCMdod6QA=;
 b=CPUx/hgjLzITknFjNeDQSHo7SpTEkDfdE/dDZFAWzSN/nPg4MHDnlykm/2aJGX9HvpQX/v82bZQpiorn5nzRbINsPz/9cbEIS4NqcpPZvb6jY27HmI6Ey4v8RAEt8BiywbbA1ZVC04UuA8J94R9GDBdmaDWeYLybyVEd3XlO1hoSAnV9jF2ArQSGntV7Y/jAor16/qRzx6vTkZxa7UpMglqTu1D3tdHWLyRwB9dDYGaB6syqgb4SIJlwYII24Xd/vdKQoDXnXIe/il8dgiV0CbHh3aQ2KQMWf8Qb9QXnZV4cHQ7TzDtqeqUuXJDfDe8iVLxqwQumfkqy+iOzYBPlbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+NOxynQXX1tQdQGDdvVqQcs6GJKWsm6hgQHCMdod6QA=;
 b=IYLzcUiEe92D+6KYblmwKB79AOT0zRWgvI4J6uhDiqhbGmejt7BCU1WckA8QC8cT0PEFU4xzivADIePG9GcfQj4qg+fFbzdRHCT2JpkBKP/GpxPzqcIhjr2DqmdmKTFkKPLuOdZ0kVqXrXLvSaPepKRMsBwBWRD1Ehdkf6ysqVxKv3AfenU6aDDI1HFAxfWXhrCJ6yo7L0FNLaASApLuLfL6oWWKHk/A6AmqVKeJImOuODZ3F5llAw/qPbJT5VHDO1azXCTBbSyF6VTcFpDUy6vJr7bV0JlemdUHK4Uy/L0KPc51jkFC4Gg3x9al0eiq4l9l86FlRpKbn059O5srNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3696380a-b3f9-8fd3-a900-c15c6eea74f6@suse.com>
Date: Thu, 6 Jul 2023 10:34:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2 13/13] xen: fix violations of MISRA C:2012 Rule 7.2
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Gianluca Luparini <gianluca.luparini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <76cf70cb43492966fbcf77d7a2d67d90fe0a32d4.1688559115.git.gianluca.luparini@bugseng.com>
 <alpine.DEB.2.22.394.2307051646360.761183@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2307051646360.761183@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7484:EE_
X-MS-Office365-Filtering-Correlation-Id: 55e2fa02-ae2d-4220-fb76-08db7dfbcf06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N93ofNk9+gkHZHYR6V0CqEtptW8fn3upvKTADlLOqpcUW7M05rViVk6lYBeYCFVyKW5QjCZhbJdV3AzxP8v6p3VO4tj7lDHgkDevNB98S7Ee+k/XUvvGPw8/UMzbRNW25DnCOpnhIMWpOzliYD8iKNmyBfnPPfbRha0EjEyi981v6kkuo1OJ0RbuHuxlSmaQGwgoNPGUM2TRf1DVM5beQooYIz6/7oJoh25vtrXk28CCz50TmQOv17ab+U+zKv4stV8tz5yLEgUpDcrAhihJutLKSW+OrE8mCzpi+wQxovbcm4r0h58mjkzxyvNXbuSxGGjNRMtxQihzaGwZMETMwc7PVV2eS96faemxLSZrb/Kg9MME1d6us9GvTJBIWxWPQ4g/3jYhKoFyGxHOewk0sL8ZE0kry/x9cSXKJiC/GdokLZW9XSeboaGh9hYTVeW+Q+7eeGj/Vqtpoc6wgqb+3lp6H1d0V8jzotcKSMm+1tWxojYCgXjb6ym1MGGrAamh9N5lSA2rD/VIIV3ldekjfgXy/IxIGEPGyPFCeisBVMoOSbQDsLeTwuuiuam63IJBfpRPs+B3KC2kb/6qz/oZ0YItHHM809wYtiA4hFmPwrmPVXA9WMyaFpC5peXhftEGFJD7sSW2fOPfxIlx/buIgg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(346002)(39860400002)(396003)(366004)(451199021)(8936002)(8676002)(2616005)(2906002)(5660300002)(53546011)(26005)(7416002)(6506007)(31686004)(186003)(41300700001)(6486002)(316002)(66946007)(4326008)(6916009)(66556008)(36756003)(83380400001)(54906003)(6512007)(478600001)(66476007)(38100700002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlRnZU1heFFGaWx3N3p2dnVyRXR5SzY4c3ZaRnZWdzc2SUYwS2FKbDNGN3FG?=
 =?utf-8?B?ZUZVcWc2ZHNqQUVJTmRMQlBPS0xTYm0xbm11QUEzTmN3amVENDNMOG9Dcnd4?=
 =?utf-8?B?WlJxUGI1Mmx4WEMxRkZZQVdMOXlMemNlTER4Qm5ZU1VjVTM0aTZZRFJnVXNJ?=
 =?utf-8?B?d0k1V1RSRW1BUWg3Yk1xd3lOWUhWVUc3aSs4WWJHWEhWU2Qyd3lQdlFjZ3B2?=
 =?utf-8?B?VU1mdjB6Y3Qza1NONjN0dXlSVlBNSitSTXpENWxkU3pSVTlRaEE1ckpVQTRr?=
 =?utf-8?B?TmRNQUNGTUxKQklZSTZnM09kbjZQM25hNDU5aWlDajVnWTUwdkRlanR2dHFq?=
 =?utf-8?B?dVBuekMzdm5WeU1lMW91WHJ0Zk40UGJhL0Yrc0ZmbUdDM0tpdWtjSmM2c2hW?=
 =?utf-8?B?VFFwOHFSKy90UGRpTmZ5NVU5YjRYY1BEVjcyemoxdDVRSVNLRVVzYlhWNmZk?=
 =?utf-8?B?U29MQVdMVDJtQjFCdW9OeFVSaklLZlFwMEFKcE9HL0hXNmtZQjFVTzlWQm53?=
 =?utf-8?B?bUdicmtOYTRlSU5QMW40VGdlUmFPWHh3cEY4Njg4UTRNeUhPR2NpUzFTUitN?=
 =?utf-8?B?L0ZNYjcwRm92VXlGZm8zWG9RTlI5MXgwRStpMkpwcy9Ja3oyUGo2WHdhZDRG?=
 =?utf-8?B?MXBSUk1weGNDOThNZDdsOTRWalMycFBGdVBWaXhNTU9FRlg4Q0IwRDhybWdP?=
 =?utf-8?B?L3lTRUdDTklmWHlwd2FJckhsbWk3R0J2eEZEaUh3MUJoSHZuNjIvTHh0c09l?=
 =?utf-8?B?OE8wZ2xGMmdCcjdSVVk1NURaWHZ4cjBCQXJ6R2NoblJmbTRuYVpjZHljMGZF?=
 =?utf-8?B?NVNOUURqdEZ1bGt5aWx4ejhzMWo1ckdNNkdsNm1zM2RpREZ3SXZlSFdIbGNh?=
 =?utf-8?B?U0pMZXZUZWFyT3d0NkVpcnZQM0xiMlNLZzIxRy9LSktOSFBmVFVqdmc1R09G?=
 =?utf-8?B?MUR2QmE5dHNRcFZzeVpMWFZMQ096T0NvTHI0RDR0VTdibXc0RXhIVFlBbnRm?=
 =?utf-8?B?azVoRCtlQjFENldYUFJ3eUd5dmNDRmpSL0w1cXM1eitHMlRRb0xGekxYTllt?=
 =?utf-8?B?Q2JyVXpKWWsveUY3dHc0VVZ2MCtXRkdDLzYzNW5XemZjRjJLd0tJTURQNTlI?=
 =?utf-8?B?Mk94UUhtRTJqeHBzZzg0cVRnM25haXdqVXQ3Y2RRS2g5cjlZanZGd1QwRkU4?=
 =?utf-8?B?N1JKN0ozaXZjK3kwZHUxaU1kS3V3Q2tiTWJ0TDVJOXZoSGJHemt2U0d5N21V?=
 =?utf-8?B?SUdScDNVbk1pbUhyY3IyaHFCK25hZzdWRGVrc3RxNW0vNnp1VldGb2UzU0hT?=
 =?utf-8?B?Z2ZoakFGcmQzRG5OWlc3S0RrTVNzQXF1dVlUTXhoZ1VmdFN5ZFRNME55b3FK?=
 =?utf-8?B?MkFwcVJZa1B3UjFWcW5CWGlBOHRmek1uS0hUTkxIWmRIV2xhOHdqSUhaMHEv?=
 =?utf-8?B?VGRQbXFjODk5c0NQeHFJb2QyaGo3ejNxTnFCSGVNeXlYazZFblhrRy9PN2R1?=
 =?utf-8?B?a2srdHoreXU5QS85a2x2STRuMVBEKzNRR2g4V2trcG9nUHAvclVSYUN4eklI?=
 =?utf-8?B?WEcvRGpXWmV1SFBMeXNQNjgvQnc4NWNkQStDSDFXdnNSZ0k4VERDQy95dnp1?=
 =?utf-8?B?MXpIdGFvaWNuVit5SzR3dnNyYzE0bCtQaDh6YVJ3WTZWNmd4V3ZLTGFMY1N5?=
 =?utf-8?B?TVBIVXIxVi95MzdOQm0wYkx2K1F0dlBuZUpKVHJkZVpSYmpUNHJyWTkvMnpJ?=
 =?utf-8?B?MEFnNnZJdUtxOGxKejdoeFBBL0ovblQ5ZWs1b25TQldFUlR3N1VYN2ZXZWhB?=
 =?utf-8?B?aDVjQXBKVU1qWDUwSUJHR2JrV2JRQXVWUFljbHZLSDl6TGdCWitrTE1kV21P?=
 =?utf-8?B?djUzcFJzRENBM3dIbFRmK0R6cHoyQjJoZ3Y1czJSanNzL1BOSlJNMlhVbWRi?=
 =?utf-8?B?MUw1RXVuOWxTeVZ5T1k2dkhBbDFkd2gwVXlhdlRDVzROS1UxK29zZmdHMitN?=
 =?utf-8?B?Q3hTcHBobHNTLzE4UFNOOHFsQlE5T2FsQldXTmNMZ3p6RXBuMTRoSzB1VVQy?=
 =?utf-8?B?MmlSWlYyRDUvbXFDclF6VGZ0NVh1QjlnWk94QmM1NFBKVkt4UEJwY2xhVjFR?=
 =?utf-8?Q?fyLFknxUGttKdbd5n2GDIa+VO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e2fa02-ae2d-4220-fb76-08db7dfbcf06
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 08:34:26.8073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YQuAd216oPnhfFF0WB/5Tpa2ael8m2eqB5MyQ753Utiq7TRCnxTUNxf7AbeaTOcdPw/zGvbjTZzDzgEnEROtMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7484

On 06.07.2023 01:49, Stefano Stabellini wrote:
>> --- a/xen/include/xen/bitops.h
>> +++ b/xen/include/xen/bitops.h
>> @@ -227,11 +227,11 @@ static inline __u32 ror32(__u32 word, unsigned int shift)
>>  }
>>  
>>  /* base-2 logarithm */
>> -#define __L2(_x)  (((_x) & 0x00000002) ?   1 : 0)
>> -#define __L4(_x)  (((_x) & 0x0000000c) ? ( 2 + __L2( (_x)>> 2)) : __L2( _x))
>> -#define __L8(_x)  (((_x) & 0x000000f0) ? ( 4 + __L4( (_x)>> 4)) : __L4( _x))
>> -#define __L16(_x) (((_x) & 0x0000ff00) ? ( 8 + __L8( (_x)>> 8)) : __L8( _x))
>> -#define ilog2(_x) (((_x) & 0xffff0000) ? (16 + __L16((_x)>>16)) : __L16(_x))
>> +#define __L2(_x)  (((_x) & 0x00000002U) ?   1 : 0)
>> +#define __L4(_x)  (((_x) & 0x0000000cU) ? ( 2 + __L2( (_x)>> 2)) : __L2( _x))
>> +#define __L8(_x)  (((_x) & 0x000000f0U) ? ( 4 + __L4( (_x)>> 4)) : __L4( _x))
>> +#define __L16(_x) (((_x) & 0x0000ff00U) ? ( 8 + __L8( (_x)>> 8)) : __L8( _x))
>> +#define ilog2(_x) (((_x) & 0xffff0000U) ? (16 + __L16((_x)>>16)) : __L16(_x))
> 
> Jan, would you want to replace _x with x here as well?

Yes.

> If so, I think it would be best if done in a separate patch (keep
> mechanical changes mechanical) and keep this patch as is:

It was done in one go in patch 9, so I don't see why doing it here
as well would do any harm. Additionally missing blanks before >>
should be inserted at this occasion, and perhaps excess ones dropped
from the first of the changed lines (or further ones added to align
toe colons). While with that the lines still stay just below the 80
chars limit, dropping the leading underscores would get us a little
father away from that boundary.

Jan

