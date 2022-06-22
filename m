Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 008735544E6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 11:39:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353655.580612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3woy-0007Lz-EU; Wed, 22 Jun 2022 09:38:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353655.580612; Wed, 22 Jun 2022 09:38:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3woy-0007KD-BE; Wed, 22 Jun 2022 09:38:48 +0000
Received: by outflank-mailman (input) for mailman id 353655;
 Wed, 22 Jun 2022 09:38:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kzGk=W5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o3wox-0007K7-Bt
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 09:38:47 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60062.outbound.protection.outlook.com [40.107.6.62])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c9103d5-f20f-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 11:38:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR0401MB2464.eurprd04.prod.outlook.com (2603:10a6:800:56::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Wed, 22 Jun
 2022 09:38:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 09:38:43 +0000
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
X-Inumbo-ID: 1c9103d5-f20f-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MIH4CSFOq2wkK1oL7sx2Vnnhyb2BRgu9gnaD7+JOu8pOZxTtDSYu1SLCMieGQ0rwuD/ULBE0uGMHgx7veCPYd/oB8+3rCskZU+NUjSkwh0cApmiznGl2XWWmCnSIj7vY8T/yxaP+cuzpvg2ZxHHdIXzT8avAo5ggRP3ND1cDqSAofk3gypdeqmqJQQ+Oot17ed+DMi7IpFHmqiatDB0TarUXA+MxgGI7zzuqNEW9s82mJx6p59kRhud7mNwlm3tG6vtsZUBpcrd1jpTDHkVx0yrT6sHYrofskvMJxAVGgbCUpezKpL8SBxUtrcENDgi4CxxyI75s7TLdUuxtt5SrTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z97VoGKtP0qMWqKzSvy2pGvISlSUGeKNm1XcEf0GUyQ=;
 b=bBmJBFfv8eVAr8eplFkYxFUUxdbgcmHrJmGcd8zw3sznzQbBxhiC2fgRgj8dhTv2YHi4Fq3n1rwJ7EfBGUbG3uFIln4VnLzztcvtR7wV1XIA9g2QUcAGFweUsYA1hxjW8txIll2ZmDp/OhjuKXmk96k5/PQd3FJ3OnT5KZgoCOK1vXNOgRgI+ia07vXECBpaOEMWppIvuI8EDylb3tu4EM6BxU71+opsNguO0e0tNVwxJ++vG0UR9dJxdg+yqf/dPwOkHwe1bze4SIfx3Xo0Avb0CRH3LwnITput+Bmdl5XiTIrjlTapemxGPhZFmyAweDo2DJAmtgXL4t3K5k4PqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z97VoGKtP0qMWqKzSvy2pGvISlSUGeKNm1XcEf0GUyQ=;
 b=Rl7aIU7jwqVEy0izta9X8ZBwGW7jVntQ/fhmx+hIgBam1e3PtLznawIWvpeGw1i+EclS3T2327Ch+ne4B4w2izajA3N478fUjgEBpuF7raxJx28PvaymYOrUKGYxZguFIbMKalI39uU+mokMGMPvcEZirpJxvrT42oIwZHvwTN1WsMkFhqr4rea/tmeIGjqeWsb00B3mfWE3QZB5RRvRSIqFYMehWOE7LfpYqdS9WZdJQD0delpzPXGxg6mlooitw58ebUe0pg1Xn4YLqxcTpFLUlm3rtNiLssvWJfqPGFmT4YL/9xXJsdA7bU3NkTO6u0pXk+JbleuaGq5nTGM6ZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1309d21d-795e-5c2c-0e94-06cf5205e2ff@suse.com>
Date: Wed, 22 Jun 2022 11:38:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: disabling mercurial repositories
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Cc: "committers@xenproject.org" <committers@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <YrHMSJg6Rx9ULvr6@Air-de-Roger>
 <aaea6105-e83d-feba-edf3-3d7e26b90769@suse.com>
 <10a33bef-bcef-9ec4-5171-a579019a69f1@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <10a33bef-bcef-9ec4-5171-a579019a69f1@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0271.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::25) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e66cd668-4fca-4df2-81ef-08da5432ff3d
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2464:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB246489051A23B9D0B634B8B5B3B29@VI1PR0401MB2464.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M5plyy2YI/J+NoCCejLqlErC35gHR4A0SgZGstMiMqd3PDrbo/HRTUYa6vMD87EBql+y1566V8/tUi2Ujxe2SM+Aj5dCQJ5i18Q7gEGYlYPk/7NAOSDxkQqYSRUaOeehcN3kJlT0xumZ0obnCaUPaJ0OTIMPPXzKlJQcyxk7YfLsj6aaLVC9n+o15MD5ynHIIO16BlzesVZ4ftmgQq3odS4J32XhfHLy/r/I2+tRJXprxXJknEdqdbmuhllMkLm4uugQ2vzPLZZXP8APdqQW8J3r8GOkSZW4F6Gsr77p2xPf1wyQQvN+jODxHRXAL99L7z35DwGCivVO6QQnb6JDrkSuUrNCCO4Sq2yyWRMF5+56ImHTSZGX49CXCzXxHQ8Ptrw2OWITJKkS59RxL70JuS7U4YcfcgTblijEv0rPkCoO5+0xyhTsCphMI3OtHChmIjkb7lC+QFPPlzmhs7E1Ipnz9Si3fL6Qu4Ae0+cnQIi0XYAsW0zUZurUri/KboBM75b9mW/Z6pwSvNQlXQD9/H2CASDiazlZNRoloMg+I4uAo8QwDY5Bmjt/DshhPWljwyRHbNY/0a+RDwTVaLzqvDDgqHiawUvuUzG4rNK3t08H1umi57amMI4k82Ji+GlU0/tQ+NxgoiUdN210TTnCRh42QqQv0VL8vXaF6i4QWIGsUnK4ShGTaDv9UKi38TKRZFkdWef1rOIrc0OTa0peOO8OvsJgzGqiF+DYj4BnQaHI1IzNtFtLllyiY+PWirzXj2E6P/BbedxdvtKl+6tZ19q+evXS/mSMwpf2d19BAu4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(376002)(39860400002)(136003)(346002)(6506007)(41300700001)(3480700007)(53546011)(38100700002)(36756003)(6512007)(26005)(2616005)(2906002)(31686004)(8936002)(5660300002)(83380400001)(31696002)(4326008)(6486002)(66476007)(478600001)(8676002)(66946007)(186003)(86362001)(7116003)(110136005)(66556008)(54906003)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzNRVmhlYm9wRFRiVitGMTlIanRTbW9vRzlXRkFSNlo4b1ZIeG1UcmQyY2Q4?=
 =?utf-8?B?dmEwMXNmcDRJeEZPbnZyMDlMTTVKemFRU2ljbzRTYmxVby9raWpycGF5ZmE1?=
 =?utf-8?B?QTFIcFAvT0FBQzJMU3hJNWUrNnYralkvMFJ4S3RZbm5LSEwzRTdEb3p3ZFEr?=
 =?utf-8?B?OG1xRFUwNzlWak1NbDN0QjcyMER6N2dEQlZNYWlqaDBVemplU01qSWRhUWRa?=
 =?utf-8?B?a3hodDQwbEdXYXExaWdFbWVaS25kNE1jSmlScCtGWVFOME94ZFF1UFFQN0h5?=
 =?utf-8?B?QzNRNnBzZnNxR1RoQmo5d2VOMlo1MFRLVVY5WTNKVmhPZEd2WExhRDBVaTNB?=
 =?utf-8?B?R0oxakZNcDFBN2pSaEdvNEV1VytxVFRUSWpkR1VIdklnWlo5dWJkZ1laQTFN?=
 =?utf-8?B?TmE0dG1ZcWpMdGFiM2VveDBXUjBsQW85RjM2Y3RhdU9WUUFTeFdKNFB1Sk0r?=
 =?utf-8?B?VFE1NkVvWndKOUpLZWNZMDRoWVMyU1pLbkNZT1R1akdjYW1LdXQxd3NNdkF3?=
 =?utf-8?B?b3RxVjRaNTF2aGdXdkZUTCs5MkVIczlDZy9ERXVKME1wRGY3TlFGVDBESmVM?=
 =?utf-8?B?dmtRSUxzVWtrbU5sNEFaQzVpU1lQV0dTWkJwODNKUS9Mc2dxdjVJRytuYnF5?=
 =?utf-8?B?R2JvRkgzT28xQ0VGZG1tMHNibnM0aW1NK1hib3BYSURTV3BSN0dlUUx0aDlx?=
 =?utf-8?B?Y2VEaXY3cGo1UzlBcTFkc1BZbW0yZlkwL2hzcG45dEd5U0IxeitZVWwydjh4?=
 =?utf-8?B?OWVycU9Id29YL2g0S3hMcVNDK3hMUDR2amNIbTBQWlVQRGd4Q1ZHV0UyMjhI?=
 =?utf-8?B?KzdGYTRQL1NWT3NGTjlhSHBRUm10MzNmUEJ6b3J2OWFVRWJyRW5kNXFFNzVw?=
 =?utf-8?B?dkpOUkNRb3Q0MHoyL1k2cjdKM0pqOTUwQll3WTZaVWh0R2VjaTh4MXZpa2Zl?=
 =?utf-8?B?QWpPSWZhYWZsZUdOUzdyUXRzTk5SK0pCaDB5SEo0VzJiWklIQjBkK01zZjFm?=
 =?utf-8?B?SGl2RXJPSnVzUEEybG1tVjBSSTNlaENSRGU2LzJ0dWtWRjZORlNwSUJGTS90?=
 =?utf-8?B?cElrb3lRbmE4QlVRYmhLMnp0Zk05VHlBeHFJTGhwV2tJajNaMjR6TCtaeDJr?=
 =?utf-8?B?d0JCTVp5RmhsSmk2WjJJWU5QSXZ2NS9GS1lKMTk3aE1sSU5lR095STZQMXEv?=
 =?utf-8?B?UlZtcm1RREhTdDJ4cHRhek8yYnI0ZHhSWEYwcm9SL0pac0EwVmR3TEdKNCtE?=
 =?utf-8?B?Sk40NmdJOEtVVzY5WFlDMytwVHJjc2xVVGpkNFZuTGZqdkdaQnpaUjhSSTZv?=
 =?utf-8?B?TkdidTVkVTNwS1BJcVM2QWFjZUhoN1ZycWp5MXJPK3RmWEErOHR6b0ZBeXRh?=
 =?utf-8?B?TmZ6YlJOaEFhbjN2MkFIOE5Ocnc5OXpMUmw3SWNFcEE4M1FWb3BpYWs5eXdD?=
 =?utf-8?B?Nm1scy81bkZUTmF0Z3Eyb3Fha3RRbmxyYi83UHhYdW1XTjU5a3NlMUdnc2pD?=
 =?utf-8?B?a21Cak1FWDhUR25QZGFxUHMyQm5yWlNRODJ5NTE4VE9XMDU5bHpEemNwT1RF?=
 =?utf-8?B?MEtBaHJ2bHB0Ky9hOXRQandER0hDa3AzV2lxa0d5c2h4L2lSTHo5MzdMdDF3?=
 =?utf-8?B?eVRBTXJBK284UGw0TU45dGs3cHMrdHd3UEgrV0lmZzkrRWxBaVBwdk0rU0RT?=
 =?utf-8?B?ajMyU2dXQkpNalI2MmpYZXRNaXM4L25iY1kyVWhVc2xPRUM2UE5EVGhlaWEx?=
 =?utf-8?B?SXhHdlJOVjhEV2hxR3VGelVKQkpsd3VGZmNBbWhCcnJETFJaMWx2VldPY04w?=
 =?utf-8?B?ckJYZ1Z6cGN2a3ZOU0ZWNzVpdFJoNnNxV3VHT2hFTmxMcGNQRHpETkJYLzc0?=
 =?utf-8?B?TnFzNzUwRHJuTVJZbkVWTmM3dHdaYXRZajNWMm5xeEhpOEdZbjFhQ2tYcUox?=
 =?utf-8?B?SU9XR05KajBZYmRVZ3cyM3J5QTQzcjJRUkZ6aFhETGNMMjNhMHkzQTJqdmxC?=
 =?utf-8?B?ZkJoODh4b2hLdVVDeldieTdack9Sc3g0UjNSRzNqMjA2ck9QYUM4UmlNT2xQ?=
 =?utf-8?B?V2hzS3A0MXFqWE1jTjNudHlrcXZCaUUvaDJFdFNndnFPM1Nra2Y0YXErc050?=
 =?utf-8?B?ZXdMdUtXbnl3SXg3STVzczVJc1RCWjQ5QlhtbWdkRG1TY1NHd29GU3hRY1FJ?=
 =?utf-8?B?WnlvdmRZREV3Q3BhNVBINVduTnd1Y3hUeFdpOGRiUFYyMnA5bDFUTjFBZUJp?=
 =?utf-8?B?K1NDSWxUSCt5Ukt3NithY3dvdTdMVCtFN1I4d2xWLzRJTmYvQ2NNSmpVdTNp?=
 =?utf-8?B?c1B3cHdPWVVJTjlpNmtEOXpGNlhwczFRQUU4SWt0c0Nwd3FGYXdNUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e66cd668-4fca-4df2-81ef-08da5432ff3d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 09:38:43.5384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gVOLHbXZ/sD4DDXGTS80A+yjstO6FbvZGcW19hvPjwd1mInXbIGqwKjHt638VPuQ0qpYP+BPqrDnb4WWJxzt/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2464

On 22.06.2022 10:47, Andrew Cooper wrote:
> On 22/06/2022 09:41, Jan Beulich wrote:
>> On 21.06.2022 15:48, Roger Pau Monné wrote:
>>> Last week we had a bit of an emergency when a web crawler started
>>> indexing all our mercurial repositories on xenbits, as caused the load
>>> on xenbits to go beyond what it can handle.
>>>
>>> As a temporary solution we decided to remove access to mercurial
>>> repositories, but the contents there are AFAIK only for historical
>>> repositories, so we might consider completely removing access to
>>> mercurial repositories.  This would however require migrating any
>>> repository we care about to git.
>>>
>>> I would like an opinion from committers as well as the broad community
>>> whether shutting down mercurial repositories and migrating whatever we
>>> care about is appropriate.  Otherwise we will need to implement some
>>> throttling to mercurial accesses in order to avoid overloading
>>> xenbits.
>> While I wouldn't strictly mind its shutting off or the disabling of
>> hgweb as was suggested in a reply, either would mean to me personally
>> that it wouldn't be easy enough anymore to warrant trying to hunt
>> down the origin of certain Linux side aspects in the 2.6.18-xen tree.
>> Admittedly me doing so has become increasingly rare over time ...
> 
> We could convert that into a git repo (probably a branch on an existing
> Linux.git to save most of the conversion work) and make it available via
> gitweb if it's still useful?

If such a conversion would go cleanly enough, why not.

Jan

