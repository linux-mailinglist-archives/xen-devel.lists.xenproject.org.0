Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A0A582718
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 14:53:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376176.608772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGgXM-0000rj-Vh; Wed, 27 Jul 2022 12:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376176.608772; Wed, 27 Jul 2022 12:53:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGgXM-0000ot-SB; Wed, 27 Jul 2022 12:53:16 +0000
Received: by outflank-mailman (input) for mailman id 376176;
 Wed, 27 Jul 2022 12:53:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGgXL-0000on-Gc
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 12:53:15 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2053.outbound.protection.outlook.com [40.107.104.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13c314f0-0dab-11ed-bd2d-47488cf2e6aa;
 Wed, 27 Jul 2022 14:53:14 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR0402MB3412.eurprd04.prod.outlook.com (2603:10a6:208:1c::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Wed, 27 Jul
 2022 12:53:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Wed, 27 Jul 2022
 12:53:11 +0000
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
X-Inumbo-ID: 13c314f0-0dab-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ShAaVYo2pp186om5l95BHj82tHk72ykLGdH7/yd8fwChe0kDFD8TrjDW57tymtI7H+XvLVR/zcvQYcd64OuWAEzVNnzL2hTFN0ou/Ze1LIiJVbteI/wKQQrqfEbhURKDtbN8RHdOyiah0LCoET4UyBHr2KpuITllrWMNn3SBel4IuIMVMhIvPHrgvNMlzWx+vDUXSGbIhcG4cy1aX820i05KbtLc5JnY+OEdCH6azQYaF/Z6BEPNP3objPZmUbSXswlO9jLxjUVwvk7rC23iLP7Bv1XmDo74xILsB84eaKZILWn5Fnrl4p0wcaKOTqeVshvIi7OYcStyB6RSJGHCew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1NSeQmfm0TmXIBRpni0a/g/m8ad3ZqQCjtk2S8LffOY=;
 b=Mp5Pzv61GUz4E9JSZ080RhAhdUFy3wR7pJ5y3nh/nqH1wdN9vK4bkvI7sxNPw0w+FCLmzC+V6aUSo4xZW+7ObUxf3ytdt4MiFqHEGEv7TpTcsXyoVtKTfo+AMvREaSkD9u855T1ha4TTCFfso82CEIIhKIhGfiwf40n48n558bfY+d8lk6FPiH3WK0BQsjfvTkrgj0koWu8TueMYepUE+oGcRVoBmtzZPFK2Ern8kdSOQlsFsgju74A8t7zehSGSIfvkckjFbkizTGtX2sunk/eb5a0Ugq8fTxKL7oobz1RvOhhSDxH8NG0XWt4xaRanFRaM1O3ippgM35Fd1U1sxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1NSeQmfm0TmXIBRpni0a/g/m8ad3ZqQCjtk2S8LffOY=;
 b=cMpU/5w2pMZmDCBrPFcOEz7Nhom97Q4uL031DjlgzXFXTJ/2fqOtfIhiCr7fSd5JrJF45GiBchV1DHJq4V0WXDCtqV4jQr+79H936YEJzn55Otczk5R8tI7VGKwHwXSQ2823A0Dp7AsqIA2AK0l5T0ORXnlG8aDQ10rT1mAQn/NXHfAeTig5XhwD//IW6vFOwClpQIuR8LKd6cP42L+SHVdBHzQPxJUKnOm8SivYXxi5euIauzmIC7doZiffeGWjTw9/p9/guvRFcJ/+rxRaq0Z9AZrApUE/S3Qdu4GcFyH+i7xO7mUhZWBj83BaUm6pxqCNxm0dpBNeLjawjYq18g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f803480d-4c31-1465-4aa7-c8f0bdc11c4c@suse.com>
Date: Wed, 27 Jul 2022 14:53:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/8] x86/shadow: properly handle get_page() failing
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3fdfad2a-7891-0b08-5541-3b226e0555e1@suse.com>
 <c5797fa8-8ee1-7668-936c-392f8298dff1@suse.com>
 <6c5b5339-f645-4214-bc53-2b7ead004367@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6c5b5339-f645-4214-bc53-2b7ead004367@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e79cdd1-b9ba-4c42-13b8-08da6fcef67a
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3412:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PQdp56x75ubo5X6MdDaq9m8EPl6dblERRz3a8ZGBApPt2mm6TZSxXgj9c8F1yrtfN2x5M4CflVJM8YNSOs00aRsbm75gi+lSDA+pv1bO10Ef5thxjYMQh02U3OW7cKUAy2bDzlN0AQeR6AviH1XaKX9WGS7nXmAgnUhsBxfDpuSuD6TW4HZvLGItFkkOHx8BZDAXsaEudmfTKXOED3a1VliN4wiBNRHP1Czvmp6orhF+0jTupur/WhvwC90leVYTr0V4laVBivGdPkFnjeJwKd028YdJ4AwuaeT1q47PFJmKyZiQO90FtmIpFFJAE3DNpqstjBkLnulcw3gkGZIGZd+BTae9iKy0boy1GphRIHelIED63/Fg7iLq62/NHKUFHMw9e58w+gKzO+4GWvRbWRGNZU3bzVY1tle+i7dMq2syKRiCC8xX4tzfn8gJ0rAnJTm5IRzTVj0zgCbF4zol6rD+6nGy8Y/FSAuOdLxQAG9u1tq5mKhfNrnKMuE+uaMchcNPljiHUuaTOqcVYsql2Smcnsa5Zo3IfuApRFJe1RRiNeHzMdwjHY+AYChdxXI3tJVV84maTMeel+5VYdaKz9r2hjXzFRoHBKpHYkXs62S1vTd2k7NrQO+epb+8t5E5hbQ5LWdNebcrFTLkMmtYArg8NaKWLUe5WMOaNXz11mh6nnbHvA2ylRbXYZ/wPm3z1QdwY2+UGnizwPn/Tp0rUfiBvdVExbUOZWw72kgImqs344pJ1tHlHt5Mik4orCOE/i40JkoNdfRdr7trvWgiwFJAOMNYBYCFIw/TEjjKN3IjXQ5jmaYqVy1oPwuHX+yk6Pj7F7pUiAt3P1+UEBV5xQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(346002)(366004)(396003)(136003)(376002)(83380400001)(5660300002)(53546011)(2906002)(6486002)(54906003)(6916009)(478600001)(26005)(38100700002)(2616005)(31696002)(316002)(31686004)(86362001)(8936002)(6512007)(36756003)(186003)(66946007)(6506007)(4326008)(41300700001)(66556008)(66476007)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajNNSXc3LzNBbVdqQ1BoOFJWZXJqRkNKV2hhTEFVMDRzeWZTRXRMOTZOU0sw?=
 =?utf-8?B?UnN0SU9LR2l0enpQV0hEaE5KNUVxbENvT2tIelo5SFFzSVJBWFJodHU0azE1?=
 =?utf-8?B?K3VMMXV1L2NDeVY0VVJiOU54Rzg4dlJueUJPRGZ5eXdlVzVPZ3lZQlY1bnhp?=
 =?utf-8?B?MUVZMllMQnZTY2JQdmUwS21RY0pRZUlzbU1OSGlFZmNnbXB5c0JoNTBjdDQw?=
 =?utf-8?B?UW81blA0UjNxYzNpbmNwMkIya1RjK29wQlBJVGppZFI0WUhhQWkzSHpOYy9O?=
 =?utf-8?B?YXFsTS9wYUkrcE02MDhiTm5Rb2pkZWI5Wkd0ay9CaXZFdlpvUlRUUGJPd05z?=
 =?utf-8?B?cHBNM0FzQ0grbVpycmYrb3FtbG1IdlY2RUpoSzA3UTNJOC9sZlBJc3hPdGMv?=
 =?utf-8?B?TTlHRURJZHFNdmJTM3grUGxtQ3NuSmsrTHVTVDVHcHBJTTdOa1BzbUFXSmk3?=
 =?utf-8?B?djNnd2hQT1JDb1B4NVJvSGtNaGxWUzg2bTBqUlk1b1Z2Vnk4R0ZGYVpJamI3?=
 =?utf-8?B?Qnc3OWxTbmFud041eEZ0S0E0STg1V3loUEtlWG8xcVdzZk1nSnhmYm1Ka2lG?=
 =?utf-8?B?WTJyWUdUeDJ3VHVtVFMyTUR4TEdwQzZ0OTROY05TeVJRVHhySlAyWHFwS01y?=
 =?utf-8?B?SWFFVDByUkFpUGNZdmMyQW9DUWd4cXl0WHZlMmVZOXFyS3pGb0YzU01jNEcy?=
 =?utf-8?B?eHcyYldBTncxMWtvbTRrWDI5K25tcnlFeEhBdGF2QlBQZWVPUXJhQ09JbHhW?=
 =?utf-8?B?WGlPUzlzL1ZFcWVBTjlqWkJtTUtSMXRRcSsxV1N0YzluVmZhaGl1UHV2bXlG?=
 =?utf-8?B?Mmp0Tkpjb0RrbGx4Ui8xVEU2MjR5Z2ltVXB2Y3pDUkh4RHRvZlRyWXo1TkJL?=
 =?utf-8?B?ckNTa3hFeGtDUFYva0FGYnBsTFVaaHRwWW1od1VvQ3FuQjFwdmhSeUVST0Jt?=
 =?utf-8?B?YWI3a1ZOS2tWS3BOK296VjU0amJGdTBXSndkTXZzQy8xRXg2VytUY2xYQTNM?=
 =?utf-8?B?QkluYngza3lPQ2I1NmZZd1lZSm1wbC9GdEVWMlhNTFN1OEx0QjdYWjJpRFdM?=
 =?utf-8?B?RDYyaElMblBhT0RWQ1JCY3ArMUVTeTdDN0d5UFNQZHBDdHBUVFhXa1p5QmtN?=
 =?utf-8?B?U1BYdHl2emdDa2ZJbGpRZUYzZWxWOEVDME9nbWNvL3ArUjVaZkl2OEFYUllH?=
 =?utf-8?B?aFQydXMyaVdxbEdtcDNJZVJWOHErdExQd1EzM0RibUNyOWdieG1zQXdJQ3FH?=
 =?utf-8?B?WHJIWjB3MktuUGFqRGxBV3FscVRrN0FUZ0tlNHBNc05HdnZoUDladGR3NFNK?=
 =?utf-8?B?eXhLWkRFYTQ2dVcwNk10b3Y1YXpoVWszVmpORTBGMmJUazJ0N1ZveldXR3do?=
 =?utf-8?B?b0dCOEVZSE02Vjd4akx4b0RKYW1rd2VOVDFpRGs3SkhFU1hVaUVKZHJYdlFn?=
 =?utf-8?B?WmtKYlBWeFFmeTd6VitJRnNsc21CM083OXVmMXlRaCtENzdRVFZ2RmEya08y?=
 =?utf-8?B?NnJ5eTV0ZDE5bk53RmI2L0xLZ0xJR29nSnRqdElqREtmTyt0ZEl2NC94VXhz?=
 =?utf-8?B?R0l4WGY1bjN3d0J2cEVqZnhhblJ2YlBtc3VGUGR2cFBjU2pjOGtPbUcvbUNH?=
 =?utf-8?B?bmxVOTVWb3Q3YUYwMnozWldFRkY3Z3FCSFUrZTV3TWpORmZZMWNSWWwvRUxx?=
 =?utf-8?B?RVh6dCtNZEtOaWhMUjd3RWphNy81cmJCN2x4T2ZCT1NZSlNKVUR3SVN4ci9p?=
 =?utf-8?B?S0piVXJWa1lMN1FQZ09mS0ZMZ2dWb0xGenNaQkNESXJlT25OZzhkbXdHalFi?=
 =?utf-8?B?OXNSYk80TWJtZmRTTXlIcGowRDk4YlcxQ3puZklXV2c1ZnlEN2JmSUJYNU12?=
 =?utf-8?B?ZzJpdkh0bXZReXpkMGZEZnF4cGVRdzE2L2wyQzRTSmUxVUtpUXhjK29Od0tp?=
 =?utf-8?B?TGZSSXdiM3NzaUlsRlRGM2czOGZudlBrYlp2bTFhMGZ1WFZ4U0NNbEZOTnBo?=
 =?utf-8?B?STZhSU5JWU9aN3Y4ZVIzTDJjdVBYYVhzakZCR0liUG9qT1Rra2gxQWJERGta?=
 =?utf-8?B?aGlFYkxSU1o5NncvM3JrL0xML0xkSDc2VCt0bG9nbklWSHc2T0Q1c3U2YWdn?=
 =?utf-8?Q?WeXjXniQjpUpN2Ys9WkhlfWlY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e79cdd1-b9ba-4c42-13b8-08da6fcef67a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 12:53:11.7206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WUjZNmDOI+P5gTOdIWjXWpwuybgpe4ZYJvkGta8kUdSreH8xjKDRLariAMXZeBDO1Md1tjloRbqVLtvzA1XN9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3412

On 27.07.2022 14:46, Andrew Cooper wrote:
> On 26/07/2022 17:04, Jan Beulich wrote:
>> We should not blindly (in a release build) insert the new entry in the
>> hash if a reference to the guest page cannot be obtained, or else an
>> excess reference would be put when removing the hash entry again. Crash
>> the domain in that case instead. The sole caller doesn't further care
>> about the state of the guest page: All it does is return the
>> corresponding shadow page (which was obtained successfully before) to
>> its caller.
>>
>> To compensate we further need to adjust hash removal: Since the shadow
>> page already has had its backlink set, domain cleanup code would try to
>> destroy the shadow, and hence still cause a put_page() without
>> corresponding get_page(). Leverage that the failed get_page() leads to
>> no hash insertion, making shadow_hash_delete() no longer assume it will
>> find the requested entry. Instead return back whether the entry was
>> found. This way delete_shadow_status() can avoid calling put_page() in
>> the problem scenario.
>>
>> For the other caller of shadow_hash_delete() simply reinstate the
>> otherwise dropped assertion at the call site.
>>
>> While touching the conditionals in {set,delete}_shadow_status() anyway,
>> also switch around their two pre-existing parts, to have the cheap one
>> first (frequently allowing to avoid evaluation of the expensive - due to
>> evaluate_nospec() - one altogether).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, although with
> some observations and a suggestion.

Thanks.

>> --- a/xen/arch/x86/mm/shadow/multi.c
>> +++ b/xen/arch/x86/mm/shadow/multi.c
>> @@ -132,7 +132,8 @@ delete_fl1_shadow_status(struct domain *
>>      SHADOW_PRINTK("gfn=%"SH_PRI_gfn", type=%08x, smfn=%"PRI_mfn"\n",
>>                     gfn_x(gfn), SH_type_fl1_shadow, mfn_x(smfn));
>>      ASSERT(mfn_to_page(smfn)->u.sh.head);
>> -    shadow_hash_delete(d, gfn_x(gfn), SH_type_fl1_shadow, smfn);
>> +    if ( !shadow_hash_delete(d, gfn_x(gfn), SH_type_fl1_shadow, smfn) )
>> +        ASSERT_UNREACHABLE();
> 
> I'd recommend crashing the domain here too.  I know the we've already
> got the return value we want, but this represents corruption in the
> shadow pagetable metadata, and I highly doubt it is safe to let the
> guest continue to execute in such circumstances.

I'm happy to add or convert, but please clarify: DYM in addition to
the assertion or in place of it?

Jan

