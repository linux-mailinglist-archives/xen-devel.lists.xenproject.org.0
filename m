Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D7B78E702
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 09:14:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593385.926394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbbsj-0006ho-U4; Thu, 31 Aug 2023 07:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593385.926394; Thu, 31 Aug 2023 07:14:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbbsj-0006g8-Qw; Thu, 31 Aug 2023 07:14:21 +0000
Received: by outflank-mailman (input) for mailman id 593385;
 Thu, 31 Aug 2023 07:14:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xL7T=EQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbbsh-0006g2-VJ
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 07:14:20 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe02::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fffeaa28-47cd-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 09:14:18 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8335.eurprd04.prod.outlook.com (2603:10a6:102:1c2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Thu, 31 Aug
 2023 07:14:17 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 07:14:17 +0000
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
X-Inumbo-ID: fffeaa28-47cd-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2SPc1PmhqmkHcg3yA65aqPrToMN5Vfp4XTHQkvbecUvfVpHvu8Q+jrSXqZVu5j3ZbOkmhB0wQtWH2NqutlCCY7biddshusB9vCokldSKvgUXM1M0Oa+a55NIZwsFuve77inI6hT84VRTH0uGziX8RlNDsqJngwssLjx0C49G/moAr9tno18HPOUTRIc5uS2UDVyfiLAkS8goei8Bd4BPHnRJ+9XZnz4kCiEgmeYnPZKks79WTcXSkLVYK0OmeifN40q0Qi/xnu0vy2NvmDJ1kjo+GdpsVGhjzB2rYW2yNfugcWj7AU54PjFqL4HH+SoVWdmR+mVBWca72u5HN31Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83eCGobUtZzKSOusBp0Da35TwErztEHHH8xzXkDxB2Y=;
 b=ie5gpUySao3npO5fY/mlRpy4uSq37BfcX7177ur7fc+bhI8gPdM5MBsxSIhnYs+Zb88mMOgIgjLks79YWUmHLwvymtwsvm9L6CZaMMWZ77yWJ0ndBusqmY4ELioTLQgmco8YH9ZqKreFfYgZ8fo+SSClUMilT6sNJ4SJsX3Fjdgb25J73oa5wxhUCEh1gWjQ4FTqQUouOnMsQsADCEXxc5LQynatkk7uG4CRzD0D9XD42m24jy4rY9EBuXgVx6cQHV0hdrPlMQxpjAcnR177tlQkBramqMGGPsThPKnRF9Boruv6UTGk7jiawU8VAvH+3l0GJ8f4qeYryh03dd5XMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83eCGobUtZzKSOusBp0Da35TwErztEHHH8xzXkDxB2Y=;
 b=Qg+t16pIY6CZo4XNW5h+9fcNsJdilT0bNpleQAQ+1pqZUysZLwBXaHdoro5VDhkY3G71ut/fgwbXRK4as/P7+5YPONZNrS+rtrXNpRtafFWj1TL7IiVls0dV7xCyZXs2J/RbgyGeCKzomyQHHmq5Q39cvfGarYU/VjzM2Klw2n1ZTN/Z63vI5PSBcuNL6alITwlIgRkS2Eif+XlLXc9e1SF36/4kbH3AxoEYKF9iROmRR+8C4PXL2eX+F/7/H5EB7KCpFlSzOFCrTKgDDVnxkK+tuoTv1CnEYA0QjvEvn2qdNxY5CwTuBYPWuqDb91hYWcMP99qFW7Oq608niA5xgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dbefa7f3-5bf3-880f-ba3b-f63659a7ee10@suse.com>
Date: Thu, 31 Aug 2023 09:14:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [Xen-devel] [PATCH] x86/HVM: correct hvmemul_map_linear_addr()
 for multi-page case
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>
References: <5B98D7CF02000078001E7AEA@prv1-mh.provo.novell.com>
 <ZO9Sj5YDjiKIh1G-@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZO9Sj5YDjiKIh1G-@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8335:EE_
X-MS-Office365-Filtering-Correlation-Id: 4df6f2cd-c67c-4cb9-58b2-08dba9f1e34b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iyDVwhL50xGgJKEc1Tq/FZMTYF9ubOy8ki1yo041E7hyqjKN3eKxHXe1AZTjTXkkKyUlhSGhf9iJtu6/O/i/cvf5+RwOREp0aOsBmQIRx37+n6C+B56gOC0Io29Qo613+l9lxjqN6qQqP7YRcrewXWx1aVE6BUeTwo83E6KmwIGIXkDpKplQZVh/D4flOlH6lTsOegcCNuCwzdQRmogAMsS+z1ICxdzs3BYYxTdrNqXS5aylM/MOoN7z5Fw33NBI003nAVpCoBS32eb4Q9S1vLcq1Om3gpv21n+U9GOQVlY/7c19HGOx8TUY7GFMqOsSfT3x5H28txS2Qo3SMGJhsIy0jvPlQ6fyI1x7xd1qgTdNbHdvcjKKTcriqx/f3icYIslCKRMr/jwXTvtB4ntfVhUwT5D/0d0KJlz99rg7L64k/tU9064uPKwj2ycwOmQ/tDUdSSIKFHlghYXxtt0CEqUnRMKq3bBIw3vfnNRsiP5qpIsdPq/dC9Y+b/keDIwCKFSDY7xgMNSfOKgJ20Mf+RmK4NJu6xpcQ49Kn6fxUVmdGXKXStsk8Ve4WVFIBMbcIxQo9oZMxOhzG/0oVVSHmhu9voqyVi1k8pESV0WhnI/opvS+Qx/81IrB3MJ7577Uuuf52RrbLIwWykCTGOPrqg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(376002)(346002)(39860400002)(1800799009)(186009)(451199024)(31686004)(2906002)(86362001)(31696002)(5660300002)(36756003)(38100700002)(4326008)(8676002)(8936002)(83380400001)(41300700001)(6512007)(6916009)(66556008)(53546011)(316002)(6486002)(6506007)(26005)(2616005)(478600001)(66476007)(6666004)(66946007)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFVIRGUrWEhxYUVZMlhZZ0k4R0NpMDBpdFRaeEFzOXcza3FybzdIdGFyakFz?=
 =?utf-8?B?R3NycXZ5Qk9UUmViOGJ0Y2NnSi9mMlNFRWUrOHVHeXprVnpqWGU1OG84aDV0?=
 =?utf-8?B?dVlza2tuRnlOV0NvcnRDK2llWXJrandDcGZuVXE1d3ZJR2hkR2crYXlPMVlJ?=
 =?utf-8?B?MzExNnR5ZjJwWkJyVjQvWDVuSHd5d0tFL3BiYXc0Z3RmWnBUMlpySlE1YStC?=
 =?utf-8?B?RlRXa05USjlYZWE5NC9Rc21vcDBvS05VckNXSGpUdllhR0FPY0RQK0I4RmxN?=
 =?utf-8?B?WHNDOC9jSVhUODlxSWQwd0MzWUlEL3dVRWFPMDNrbkM0TjhxQnE4alVVY2dL?=
 =?utf-8?B?SE1qbDFqVCsybVVRY3hqNXNqTDBsNmlqaUd0dEh2QkYzbVBsZUQ4ZVhZT29v?=
 =?utf-8?B?U2sranpOYVNwR2NueG16b2lrMWsrNFAvdU5HTDcyWURBaUFuN3R3SjRXTnFZ?=
 =?utf-8?B?V09TYzUrSU9UOWxJSk4zTmJ1d0d4ZlIxNGJsZWVkYWhDY2ozZmxza0NCMFV4?=
 =?utf-8?B?RlZseURCeExSWGpnL3FpR3lLZVVIVzk2R0ZrQXdDNENjWTlaWENZd25nZ2Zu?=
 =?utf-8?B?V0syT05zZ1hUc2t2UzRUVGd2UysrZ0NRVnR6UVVuSEpadTdyanlPQlFhMjd0?=
 =?utf-8?B?L1VoSTJXT0d3TWR0eUZaTlhENFgvUDNtanIwYlU2ajd4OW4wYnpmQjNqclVB?=
 =?utf-8?B?R1dHOU5uNjRWclFjTTFERzF3di9iWk0waTBFdDE0WmgyVzBRWlVTbGRCaWti?=
 =?utf-8?B?clRsb3lrcHk3Ui9uc0R4bmZtN3hpbTJKN3oyZlVVakVQSFBaZEQ4cmpGRS8w?=
 =?utf-8?B?UTFvakNvNm5vYU1WSzIyNWk2L091NVF1TEl1dlZCeWlQaEo2RnJydy9rTUlG?=
 =?utf-8?B?bVF6cm4vSVY1cGVDWmJWY2p6QjBaa3FJUXRGL1VQcVpsdFZ4eHpqS3pyaTJy?=
 =?utf-8?B?ZzBzb084NnhRS0hQV0s1VHJLYmUwdkFFbjI0RzRDWEd3clNjcGF2dU5kS01q?=
 =?utf-8?B?MTBXTDgwQnVtSnhpdU5WV0NVSmtwNHlLYUlFMEZRUWtnYk1RcEFkS2JkRHhT?=
 =?utf-8?B?am5MYnNhZFBVZ1Y3YklIaWZGbWx0SDd3aHNpRmFFdkVtRUJpQlZ2emo4VGJJ?=
 =?utf-8?B?S29TUWRiQ2s5T05jaVVuTDNUL3pXZzVHcWtlbzZBZ05WT2ZDS1hsSGwyWnB5?=
 =?utf-8?B?MGpsRUVleGR3VXlMNDUvWUxKaFZUMEhXZUFZcFRReFhuNTJaVHg3Y1dxUHg5?=
 =?utf-8?B?YU1DK3psU0tGQkFBbmpIbmlEN3Jxeml0RS9adEZKRVpUbmFRWENqRzRUV3FH?=
 =?utf-8?B?QVAxOTRlMGNCYU1ZWFpJTmpySXlpUThCWG9mK0tTUkRJVXd4aUtFcXpSZkVD?=
 =?utf-8?B?UnE1QXBrWk92SkErVVY3aVl1K0xmbzJwdlBrRHlTdCtRbzFtMFNKb21SdEtp?=
 =?utf-8?B?bEFaUHpUYjVKR2tscUk2aW02K1N1YzM3S1FUMzgzS2dIcDNCb245NlpGak1j?=
 =?utf-8?B?eUZCWjBwVFlNQmxNRmRDTE0vZjdCdFRZTitOMDFZZG5mWEFFdmV3RzFmeUVV?=
 =?utf-8?B?dU1Va0tValcvdmhjTG9qTklFTDA0Nlo4SFJibW5TUm9uSmdSU0tVMTNYeUMy?=
 =?utf-8?B?b2dYa0FLK21Ia3BoRlBRQWtrdFZ0RDN1OXR0NUJHVERSWnVWYkMrdWo4SEhB?=
 =?utf-8?B?bXBreGc1SFZRcDFBN0RjY2VNaXUyUnhnTmQ2dUplcW1zeGFKVU5ObHRkZjJQ?=
 =?utf-8?B?eGZwSC9Tc3lPNnBGUm1pUkFGbFc1bmlMQVVya2dkSTF0ZU13c0d0QnpzalJU?=
 =?utf-8?B?Rk0zYWZkeUhOSU1UaG1VK3h4SHprTnpDeGRpMDBNZDJzbjFjNXVLQXFRZEhE?=
 =?utf-8?B?UzFrbnI2VmJOMno4cTM3dzNza2hxRWE3b2oveEwzR2pwakhkb09PT2NIVSto?=
 =?utf-8?B?UkdGS293b3Vqc3RUZ25ZK3M1RlRXRklMMWZma1ljajJ5dlpuRGJqRmg2NWdV?=
 =?utf-8?B?cmR4QnFQcElmakM3OCtLbWJoL2M5ZEw1UmVnV24wUlVxbGFldURRQzRXL2Ir?=
 =?utf-8?B?VnM5NzdYZ2JrellUVUVadEpHRjZuNlhBNk9PZEx3c3hPTkRWY1Y5T3d5TFBx?=
 =?utf-8?Q?kQo9gwUEeDD7cjoyYiWIrQcBS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df6f2cd-c67c-4cb9-58b2-08dba9f1e34b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 07:14:17.0153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kRW9VJrc9O2me6mbzt4muPhh53MA9Cbpx8uCJ/FqYolkDhAcXcD0ZvECUa0AzT7k2L59ry7sL7D0d55WsKI/6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8335

On 30.08.2023 16:30, Roger Pau Monné wrote:
> On Wed, Sep 12, 2018 at 03:09:35AM -0600, Jan Beulich wrote:
>> The function does two translations in one go for a single guest access.
>> Any failure of the first translation step (guest linear -> guest
>> physical), resulting in #PF, ought to take precedence over any failure
>> of the second step (guest physical -> host physical).
> 
> If my understanding is correct, this is done so that any #PF that
> would arise from the access is injected to the guest, regardless of
> whether there might also be gfn -> mfn errors that would otherwise
> prevent the #PF from being detected.

Yes.

>> @@ -600,27 +614,28 @@ static void *hvmemul_map_linear_addr(
>>              goto out;
>>  
>>          case HVMTRANS_bad_gfn_to_mfn:
>> -            err = NULL;
>> -            goto out;
>> +            err = update_map_err(err, NULL);
>> +            continue;
>>  
>>          case HVMTRANS_gfn_paged_out:
>>          case HVMTRANS_gfn_shared:
>> -            err = ERR_PTR(~X86EMUL_RETRY);
>> -            goto out;
>> +            err = update_map_err(err, ERR_PTR(~X86EMUL_RETRY));
>> +            continue;
>>  
>>          default:
>> -            goto unhandleable;
>> +            err = update_map_err(err, ERR_PTR(~X86EMUL_UNHANDLEABLE));
>> +            continue;
>>          }
>>  
>>          *mfn++ = page_to_mfn(page);
> 
> I have to admit it find it weird that since now we don't exit the loop
> when HVMTRANS_bad_gfn_to_mfn is returned, the item at mfn[0] might
> point to the gfn -> mfn translation for the second half of the access.
> AFAICT that would happen if the first half of the access fails to
> translate with an error !HVMTRANS_bad_linear_to_gfn and the second
> half is successful.
> 
> I guess it doesn't matter much, because the vmap below will be
> skipped, might still be worth to add a comment.

I could add one, but as you say it doesn't matter much, plus - I don't
see a good place where such a comment would go.

> In fact, if the first translation fails the following ones could use
> the cheaper paging_gva_to_gfn(), as we no longer care to get the
> underlying page, and just need to figure out whether the access would
> trigger a #PF?

That would be an option, yes, at the expense of (slightly) more
complicated logic. Of course going that route would then also address
your mfn[0] remark above, without the need for any comment.

Jan

