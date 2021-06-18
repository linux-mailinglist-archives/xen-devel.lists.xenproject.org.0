Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1493ACEBC
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 17:23:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144773.266427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luGKV-0007zw-3C; Fri, 18 Jun 2021 15:22:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144773.266427; Fri, 18 Jun 2021 15:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luGKU-0007y2-VI; Fri, 18 Jun 2021 15:22:46 +0000
Received: by outflank-mailman (input) for mailman id 144773;
 Fri, 18 Jun 2021 15:22:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CUMw=LM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1luGKT-0007xv-1N
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 15:22:45 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba8c5105-6eb0-4c2b-97f3-9ac3b71b750a;
 Fri, 18 Jun 2021 15:22:44 +0000 (UTC)
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
X-Inumbo-ID: ba8c5105-6eb0-4c2b-97f3-9ac3b71b750a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624029763;
  h=subject:from:to:cc:references:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wteIRQNxCQ/oqFYfRdxsuTXiioA6dFXU2rBMasv7mCU=;
  b=MU8Ud/2Bhsw960Gwm1w8ZdBNHvAiW2i8Rxl/ShsPs0snXqJXqKfSr8dc
   i5XliJCv4Xl1PIvFq0XpeXUgyhMpNxvmwf1Rzh9tPySiEG3Fja3GzuNEF
   mzwd6mb2FojY7jZS/MQwMviW4c2x98ebEYw4nE5oT5EFigDK+wVGxiZ3M
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rnjsZHzgBt0AhxagX259s57lBhI8pxs9qXIi2ANNXwCbGd4k1ULHf0ZM6GMK1yuFm7ML1rD0wr
 pNyEW8yHWSp0rztKHbHOdyccDnYPEzscjywiXHEvZcV8zdbd9NK0SdQeTfHfJa5IbgAqtTT08e
 RMItxKxKI+zsP2lvKbTRJcrirlU60rLg0J2coUctQcDVZLmKJJlOTbdJD+14qSscMtVY3oD0XY
 tCv+ygIeuir48Zqz+2S2kNKfpMRGCdJyAC605tKQMgYxRqVNniE7dkwAJAOxBhjXHsZ3B6FvNH
 K9o=
X-SBRS: 5.1
X-MesageID: 46470765
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:876Reasa/iZAxT1AE5bD0Jeb7skCm4Mji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK7yXcH2/huAV7EZniYhILIFvAf0WKG+Vzd8kLFh5VgPM
 tbAsxD4ZjLfCVHZKXBkXuF+rQbsaG6GcmT7I+0pRodLnAJGtVdBkVCe3+m+yVNNXp77PECZf
 +hD6R81l2dkDgsH76G7i5vZZmymzSHruOoXTc2QzocrCWehzKh77D3VzCewxclSjtKhZMv63
 LMnQDV7riq96jT8G6c60bjq7Bt3PfxwNpKA8KBzuATNzXXkw6tIKBsQaeLsjwZqPymrHwqjN
 7PiRE9ONkb0QKeQkiF5T/WnyXw2jcn7HHvjXWCh2H4nMD/TDUmT+JcmINwaHLimggdleA59J
 gO83OStpJRAx+Ftj/6/cL0WxZjkVfxiWY+kNQUk2dUXeIlGfxsRLQkjQdo+ao7bWXHANhNKp
 gpMCic3ocXTbqiVQGdgoE1q+bcB0jad3y9Mz0/Us/86UkdoJk29TpB+CUlpAZ3yHsKcegO2w
 31CNUeqFhwdL5eUUtcPpZNfSLlMB2AffrzWFjiaWgPQ5t3Sk4l7aSHu4kI2A==
X-IronPort-AV: E=Sophos;i="5.83,284,1616472000"; 
   d="scan'208";a="46470765"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8MUVguJGEuKcqDUm0cxq5jEaD7vblilR1t3jH7qo1LYRZIQKv4LlA6VzIbt+duZ7/w6u8LZxpA2ObYJGTuT9dc4Y3kNUtJV06CKk9ot5zG/WNWin36Vs3xk7hEZKINrpUuPByspHxrAVefovvjKVcoV8AhOAfnc21/47Qu2x1fo0yebCqsmEf6eRHWnLc2+hbaUufw6CUMM03snYAF6kOtTHUXV0s54eI8TOo7zV5hyv0ZX3ZssBa9QkR/mW/pXHbY8hAsTezfj5Mc4Th44BT48OebZIOSYjZ+kroPIe+rFjtEN39aV8y9G9z8EKuWbd1e2Dd7K86l0U32iiimxmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mwPVoAeXftCSkffDPD5M//2M5vcxyR7OAnF18VnIdPU=;
 b=n53NsvaoM8Ht6A8Cc9U+4NQ0oKW/JxEdWKQauPBrCQRqDuKnzJFz9r7+3k/dGFKRWId/jN08fABFeSygnLscEWGGuUMWXdZpFNXUU317icr8XdlLL5yzMIgVGNsOr2Ci6YPP7XQ6G5U7yU/1TjvRIidZrNXurwZ7tDMVjySV0FLyAuAvDbJErwUv6zAWvTht8lY4Miw82HNlRCvWN6aRXBLUwJCwqv+iE7XObvF4JmCV3QksyHM6Gi+GTiWK/8v40wiY+BgiU7GSZQedneKun3bYgX9qlWneConULzzhrOTKnennBjs0GOZ0OZaaFBgyj6Bls9B5oP5Qt9u6rv4/ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mwPVoAeXftCSkffDPD5M//2M5vcxyR7OAnF18VnIdPU=;
 b=SGKq9J83wweYcPbZUr8LaCFZeNtlV7cxmwzOT23lQWEGlQ1NiVshHAfhxe7mTYGY+gQXMbVyLqD6xkTPeWMj59W3slzvyUKzem5VqO0nnu/QoReXjpyiP72YKKR0NVH4974MCLHUAjNN5QdVwtUh96HVCbd7Llw4XD8CQtxB+d0=
Subject: Re: [PATCH 5/5] libxc: make xc_domain_maximum_gpfn()
 endianness-agnostic
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>, Juergen Gross
	<jgross@suse.com>
References: <edaf04ec-335f-a156-34c4-5c0385cba08b@suse.com>
 <99979695-e53e-7764-85e1-64dd4cf9447b@suse.com>
 <bcbf4a71-bf30-5a9e-a399-d4366ee95423@citrix.com>
Message-ID: <0258fa6c-3202-b012-90d1-f48a5f3e9d8b@citrix.com>
Date: Fri, 18 Jun 2021 16:22:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <bcbf4a71-bf30-5a9e-a399-d4366ee95423@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO3P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc933c57-7473-4eb1-86e0-08d9326ce820
X-MS-TrafficTypeDiagnostic: BY5PR03MB5048:
X-Microsoft-Antispam-PRVS: <BY5PR03MB5048F4B578E69D71EEAC5A08BA0D9@BY5PR03MB5048.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f5GTHXuf3B9DXZUH/TP9ROzu8mz6aSmthnRZq9LJ3GsfVFnxcTa5ZTFX7bGd2QzuW4O3vh2cR6xZWCHB+nIxSrvO1uZsfEdeUa1W81b9pbA5H9+dhx2KkQIp3ooEgv+uEwNRIgWNSQPh7unW38qYOktViQw+izjojh6xFMGgLs/K+8/I77olV74xnCW4cfbr2Zt/sXHudSpb2IjBoY4FZXvg/yQ/MZCsweX3m9oL3hkRYnDjnuIt6FCoyXSkc4zV1CwAyqZw6lDfi6g6Hj9nrgI/5TlOzXbuj04jeY1Vji8efojvQuk0XAxW68HwuAR3B/a8X3mAfeUSvW7LzHEfDp+MUAjvbYF8qzBV8ufjb2psfYcI1346DZ8XLL19tzoBh3206kZ20HtHgS6sL0iFR4Q0gnGeqDPvVmSXK8ewjwgZZIkuI8pu3e998g62x2w1w/swIok8h4Zpx2cxU6IqjCEQy9F9T0NGZit/ySeIWnqJZ+CdmR3oJ44QYvSpjTIcZ1E+W7CyHWFvE8meZUioJz8vrDu6YhWzhUpUYkppmARm4WzFipw4BBDhTZU01IlUu+L95f0B/Yxst5aqOu1IcdwnRn0ywYZwAZinbqr4pYsi9i65n5awSzmJS63uHDoyVI1buIlL3Rqbf8Xwmip7dUQwK+kVc4CsILZwqK3rOcjUuKhCBckROYNA9to3t4GQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(396003)(39860400002)(136003)(16526019)(38100700002)(54906003)(478600001)(186003)(66556008)(6486002)(53546011)(36756003)(6666004)(4326008)(66946007)(956004)(66476007)(2906002)(31696002)(316002)(5660300002)(16576012)(26005)(2616005)(8936002)(110136005)(31686004)(8676002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWwwYWVUek1BNmU4UGVkOUVhWk9DZkxJNUllandQaEhZSFVhSmRiWDQrdkc2?=
 =?utf-8?B?aWh0VlQrY2w4bkxhbzRYaWoxZ0NOeEtxQTdiaU1YbzhTQnV0ZEIwZ25xSmF2?=
 =?utf-8?B?dm54UjVDN2FyaTM4TUNYVHo1TWVqbFdPSEF1YmQvZkh4aG5FQWQwMDAyMFpS?=
 =?utf-8?B?L0ZoZHgvMmRidXkxS0cwV0grMU9rSEh4L2IvbWFhNkJlZUxaS050YUc2Yndv?=
 =?utf-8?B?T3pUaDgrcjVwZUdQanQvYVVRR01iYXRJQ09Bb1hpNVFscWZrMkRRMHg2TW5Q?=
 =?utf-8?B?dHdlUWNKR0o1MWZCVWsrUVY4YnJ5VitSUWN1OW0zYUZIcEl1d2pDeEtFQS81?=
 =?utf-8?B?NFU1eTBIcTJYU1k2TTNWSy9reE9ITkVPTm5uL0tSdmh5T0xuVG1KMUhueGM5?=
 =?utf-8?B?dGg5a3NTOENKRE1jdVdVbVVINW5FemRMdlRQWjFVdEFqeEVBajBkQkhyQXQ3?=
 =?utf-8?B?RTA3YnlkSUxpMk96NUFCOGhPUEJKNjZiRVpvRHhCam5WaGI2enh6c2IrcXZI?=
 =?utf-8?B?ZkpYTS9WcjhQMmtaUDRlRkJoTkJMZ0U3TmVVcHZqR3RaWS9mcW40Vkg2Q1FS?=
 =?utf-8?B?dGpGU0lvZ3pxVmFWeFZTRTNPTk1vclU5RVBialhTeTg5Q0ZYN1FuMHhMS2xE?=
 =?utf-8?B?SHdNZXAzQThTV3ZFZlVWY3B5NnhTTUFOanNIUWhPUGw4YytPYWxZN3dIZk9k?=
 =?utf-8?B?VEhzZVEvTUlDSmM1OTJFUWhPdUJHUkswTWdFZ2RRNGZRU0UyZnFRTnVmU2dR?=
 =?utf-8?B?eERyeDVodWJuNkVaT2Z4d2Rka2hMbGxwQTFPMmdSVzNZTjEvV0lCbjdmRzRM?=
 =?utf-8?B?R2pBZUdNaFY0b3pXOTFmWkxpY3Y3Y1RZY1FHYzJ4YlhGVXFYOWs5d2hoa2U2?=
 =?utf-8?B?ZUdXVlkvdndqVFJhYUswM2Y5QWNSMU5PNVI2TmhWU2hBVk1TZlJwcXFiaEky?=
 =?utf-8?B?bGlMZnVzMXpYVFNlMWNFMk5ZU0dLMWlCUDliVldyTnhTMElPN1VmanBROHZP?=
 =?utf-8?B?QXJQbGsyQXZtY2FiWmg5VTdnVXBuTHJWVmlSNHNDQ1ZVZ3RVa0hvUFRZc0Rv?=
 =?utf-8?B?bFoxTitOamt5d3hNTkdEZzNHandUcDZzVSsyNml3NjlpT0hkM3lCZ2NEQ1dD?=
 =?utf-8?B?Snhha0oySEpiWngzNlZGRUNUcWZ1RC9raUd3REcvdTFrR2V2YVJSTVRxWm56?=
 =?utf-8?B?aDBVZkl5YStMcENQa2E2WWY1MmN5azV0YnJDdGt4OU1OeEU0N00zMzIxY1Bm?=
 =?utf-8?B?dEdqN1Z2cnRFTmlFMXZLU2pjNTg3dGZtd2ZKSkU1NGIzampxa3p0c2pXQytG?=
 =?utf-8?B?SU93b0RrL3VxMSs5MGx1Wm9qVzJ3Ny8vKzBiZlczckc2YmpxajhoRVp0ZFhH?=
 =?utf-8?B?QTVpWW1nV2JVS0U0Q3BHWEVDK1BnbzVWTDBqQjZLNlpIaXFCL3RINmM3Y05n?=
 =?utf-8?B?NGZFV0lMaDU0VDVObXpXb0dkbnM0YUpaUjNoenpUeUl5M214bko4UG8xUmdM?=
 =?utf-8?B?UDVpQWJWM2lUY0ZyVEpjcjBvVWZvc0tFRmt1bks3djlrY0ZaU1VQRE90c2dD?=
 =?utf-8?B?dHVmbVE5V3pHenMyZjhQQWhObTd0aldTTXkvM2pVZkNkdjlNbW15cDlCZlM1?=
 =?utf-8?B?TlczbitZUjB0cDRTaVR2NU90YWROcFpmWmRlYnRzOEFzenN3ektkN0ZlMW4x?=
 =?utf-8?B?WHhIeEhQSE93Q2FlbVNoQzVBVmhxWWNEUHpoZXRONlI1SWJHcW1aN0NUNWdM?=
 =?utf-8?Q?mBtVyHhN7P6NKwGzhnlFFjyIbcrGJPg6Y/7HCUG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc933c57-7473-4eb1-86e0-08d9326ce820
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 15:22:38.3147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B2k2Avky5cNoMs2jNmUK0wRZE4hxCyPA3RC75DDRPZxTEN4SyKKm2nPf+aK598K7uZFPwA+ccU4BZ8veCVvOCrgNoKz6lXAPYpCrmukHteo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5048
X-OriginatorOrg: citrix.com

On 18/06/2021 16:06, Andrew Cooper wrote:
> On 18/06/2021 11:25, Jan Beulich wrote:
>> libxc generally uses uint32_t to represent domain IDs. This is fine as
>> long as addresses of such variables aren't taken, to then pass into
>> hypercalls: To the hypervisor, a domain ID is a 16-bit value. Use an
>> intermediate variable to deal with the issue. (On architectures with
>> arguments passed in registers, such an intermediate variable would have
>> been created by the compiler already anyway, just one of the wrong
>> type.)
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/tools/libs/ctrl/xc_domain.c
>> +++ b/tools/libs/ctrl/xc_domain.c
>> @@ -856,7 +856,9 @@ int xc_domain_get_tsc_info(xc_interface
>>  
>>  int xc_domain_maximum_gpfn(xc_interface *xch, uint32_t domid, xen_pfn_t *gpfns)
>>  {
>> -    long rc = do_memory_op(xch, XENMEM_maximum_gpfn, &domid, sizeof(domid));
>> +    domid_t xen_domid = domid;
>> +    long rc = do_memory_op(xch, XENMEM_maximum_gpfn, &xen_domid,
>> +                           sizeof(xen_domid));
> Why on earth do we pass the domid in by pointer and not value?

This is horrible.

What we're logically doing is passing a  pointer to struct
xen_memory_$FOO { domid_t domid; }, except its all done by void
pointers, and even the public header files don't provide a suitable
structure.

I think we really do want to retrofit a suitable structure in the public
interface and use that, rather than to continue games like this.

~Andrew

