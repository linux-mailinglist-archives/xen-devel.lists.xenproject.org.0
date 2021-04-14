Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 675AC35F4CD
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 15:26:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110605.211121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWfX4-0002cK-NG; Wed, 14 Apr 2021 13:26:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110605.211121; Wed, 14 Apr 2021 13:26:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWfX4-0002bv-JR; Wed, 14 Apr 2021 13:26:14 +0000
Received: by outflank-mailman (input) for mailman id 110605;
 Wed, 14 Apr 2021 13:26:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UoOq=JL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lWfX2-0002bq-Cp
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 13:26:12 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7590ad4f-f908-4524-a8aa-63207ba40a51;
 Wed, 14 Apr 2021 13:26:11 +0000 (UTC)
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
X-Inumbo-ID: 7590ad4f-f908-4524-a8aa-63207ba40a51
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618406771;
  h=subject:from:to:cc:references:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bX85kvMi12EvwBxMQZB5CyPVH6t130G7c420bkKAagg=;
  b=QZkdmj5gv6TCjjmzmWCvhb4THDEJ4za58LXXAqTeldkberlDcdc2vpj2
   BjILoz11fS6V2ZVO7zIZgZhOv2VUGceC0OAPYfUW8D4GRi5ZyTVEBaZpN
   JN0QNYODkK/eAxQPjMtNc/PHpxbyJskPUbM3MHrKl4uao4KfqKKef8JPW
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 5LmcrKHJelOhiep31vUMkR9e/WIuOpxmaOnT8iZN51wyOilSwoeTI6rJtqhkqoIBCgfjpMsCCR
 hDyMAfJRgZhVDlIBYK/nJDuT7OG73UwETdc7e/XYLRqmLPeINlZkDVxbjhJqdHinRcGQS9xLzE
 fOsKK99ykRaYLYrhqwEXX+Bi44A7jfX5l6BRFZBKG35112D9wchVzrIcy4sTewP5RufWAQgbz9
 OrlKpnVbAr7PmJ0SlRuxMxAURPhG7Dc04jv04S87v/On5RCNT6px0epsdZWr+sekCIy5df/HHO
 Nq8=
X-SBRS: 5.2
X-MesageID: 41703245
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:mgbOB6wItJeeN7UMAdULKrPxge4kLtp033Aq2lEZdDV8Sebdv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmqJdybI6eZOvRhPvtmftFoFt6oP+3ybtcheTysd07o
 0lSaR3DbTLYGRSpdrm4QW+DtYryMSG9qftvuvF03JxV2hRCp1IxS0RMHf9LmRdQg5aCZ0lUL
 +V4cRarzStEE5nEfiTLH8DQuTFupn3j5rgexELHFoK7wOJgDOu5tfBYmSl9z0ZVC5CxqpnzH
 jdn2XCl9iemtyY6juZ7W/c6JxKhMDso+EsOOWggtUYQw+c8jqAS59mX9S5zVUIicGprG0nid
 zd5yonVv4DkU/5WkGQjV/T1xL70DAogkWSumOwpXf4u8T2SHYbJqN69PtkWyDU4UYho91wuZ
 gjtwny1+s1fGb9tR/w6NTSWxZhmlDcmwtFrccpg2FCSoxbUbdNrOUkjTNoOa0dFyH34p1PKp
 gNMOjg4p9tADenRkzCsnIq6NKhWWlbJGb8fmEy/uaR0zRQgUljyVoZyME1jh47heMAYqgByO
 LePqtykrZSCucQcKJmHe8EBfC6E2rXXHv3QS2vCGWiMJtCF2PGqpbx7rlwzOa2eKYQxJ93vJ
 jaSltXuUM7ZkqGM7zB4LR7tjT2BEmtVzXkzc9To7JjvKfnebbtOSqfDHgzjsqJuZwkc47mcs
 f2HKgTL+7oLGPoF4oM9Rb5QYNuJX4XV9BQksonWmiJvtnAJuTRx6zmWceWAICoPScvW2v5DH
 dGdiP0Pt984keiXWK9rwPWX1/rZ0zj7bN9GKXX5IEouc0wH7wJljJQpUWy58mNJzEHmLcxZl
 FCLLTulb7+hWTexxeN00xZfj5mSmpF6rTpVH1H4SUQNVnvTLoFs9KDPURb3H6NIA5DX9rbeT
 Qv4GhfyOaSFdi91CoiA9WoPiaxlH0Ivk+HSJ8ah+ml6dr6fIg7SrIrQrZ4GwmONxEdo3cqlE
 5zLCs/AmPPHDLnjquoyLYOAvvEStV6iAC3ZehOqXzesk2Yjdo1RmQSWgOvVcL/u3dtexNkwn
 lKt4MPiruJnjiibUElhv4jDVFKYGOLRI5dAB+9f4VSkLDzcARWRWOH7AbqzS0bSy7PzQE/l2
 bhJSqbdbXuDkBGsn5V6Krs7Wh5b36QZU52d3B8v7BsDGiugAcA7ca7Io6Il0eBYFoLxe8QdA
 vIZjYfOStC7dG63hz9okfJKVwWgrEVesDNBrUqdL/enk63IIqTjKccArt/55B+Lu3jtecNTM
 OScwKYNynDFusswgCZz0xVYRVcmT0Bq7fFyRfl5G+30DoDGvLUOk1hXKxeDNeG7WToLsz4ma
 lRvJYQh6+XPWrwYNLdlv2SQD5HNx/JoWm5C8svsotZuKoutL11W7nXOAG4o01v7VEbFoPTkk
 hbfYFQpJbmEaVrd9YJey1Y8kEy/e7/Z3cDg0jTOKsGYVopj3XnJNuH7LrDlKo3DiS61X/NEG
 ja1xcYwuzMUCSC34MLEq4cIWxZb04n9XRpldnyAbH4OUGPd+tZ+kC9PWL4WLhBSLKdEbF4lG
 c23/i428uWfTH/wgbeoH9SJb9P6X+uRYeXDBiXEeBFt/y8NlLkuNrn3OeDyBP2QyC8cUIWmM
 lsclERdN1Kjn0at7IMuxLCApDfkwYCiFtR4TZui17r1MyH2Q7gbD97GDycpI5XUzlVOmWPlu
 Lf/4GjpSzA3AQ=
X-IronPort-AV: E=Sophos;i="5.82,222,1613451600"; 
   d="scan'208";a="41703245"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+HJL/DVBwVkRjoV+rTNMef/XdKPf08E5rd/vkOTE0HtBrK3DJOX7HJp+g82ittMosltPQCDj1UZEBYTT+1QrwQFxGzQw1bXHD7+O0Z7jurmvjB7q3TPpbIQBRiM2BXBqNrpJMbDaLKmwK4v0v9R11ZV/zLhHooTGkIztX/XmIcYvYrMpH04agCHAC3tW8zgGl9d1rq68nm8dPTCRHCt7uceQ97y1Fn67uRLDMFxAJm5dLeuGk6D1yh/Qo26Gi09M7RqlwdPDrJg1PoCRrssUKLjFZLyazeubJ6HUyJxv/6YynDbj17XwFjEXYfXZ5Fl/k0jetWg9VzcKGZSiHPurw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CD3uwGRZGixIgUbWmlGZxvHhKFX92PHkE4UIamvxsK0=;
 b=SNiiW+1/W1MLdHJ0pICOycBbiFTYAzR6k6SExW+6B5S4+v6p21BrJJsM6V8yLtxuHQD+A4nTz7YApI9ogXekoFtHuW3GKJ4/efHk7osdyaMUq9iwSE/jwbPu5uxyCxx9S0kvflHdfv+2+0dtdPx0dRQPUCMNdCh71pKeYpJ5QWAcIRYZPRWl7F11QB5JfCOn7w6iaAz5spkgDdLSJ600AuDcSNcGIHpqutMIl7XbaTU5zcVWKsgdeXsvYoH5HYLhc29qTtcR8Y0F6+6nyD4X8TzHRwSXPgBATX5KKPxSO48UMuQxLIUZZr6awfBUoNV3NNtDK/xaM66u9xZ+nUQDAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CD3uwGRZGixIgUbWmlGZxvHhKFX92PHkE4UIamvxsK0=;
 b=HySJE+7Vc8v1GA0xODVSvuf6e1Omgqj0/5RM6979kdY8SOX0AwEMvHhbQehB6Ixr0clmaAVhFy0HhL9iZ3bznxBl/jrfken2OHELBkzF08C3MIuV2YANNrPaB7ZTb21CFIu1q16KlwV7BwjT+w1ZKveHbgi4ef/aK3US9D0F/Ug=
Subject: Re: [PATCH 2/2] x86/cpuid: support LFENCE always serializing CPUID
 bit
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
	<xen-devel@lists.xenproject.org>
References: <20210414110433.83084-1-roger.pau@citrix.com>
 <20210414110433.83084-3-roger.pau@citrix.com>
 <29e8e2a4-3489-17b9-849b-ddfeed76451d@suse.com>
 <5fa30ed1-967e-dcd1-b9cf-110708f2c069@citrix.com>
Message-ID: <af2cb854-ca3f-22ee-a7b3-8c24fdecfb7e@citrix.com>
Date: Wed, 14 Apr 2021 14:25:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <5fa30ed1-967e-dcd1-b9cf-110708f2c069@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0203.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e344e03d-820c-4c76-0d5c-08d8ff48da0c
X-MS-TrafficTypeDiagnostic: BYAPR03MB4614:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4614775482F55639D3E94939BA4E9@BYAPR03MB4614.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qgifHWJxHKTNI8/Zhu5tbcvc5d5pCjShy3JBKC178hzkL5YCHf+CVKKgzOWrkweXqW9tTqO6ROTTKJrf8rWIHn9exOpBqg3nEgOmSZQSrmZJNEBs5CTW79Zt56aWA5gPCA53R+CrVK4xb+zBeTqnYliADrw8Toaadq69hiDLVbZIF4VEogc+ICiolXDiXIYaVfoXMyj5OLyp6OeU6a83v3SbcU6VQYm+LOBBtsPgiuQEBKe05MojhkhRDO9jTv8QyRQXYBRy0yCxZjqsAQvmapEinWTTjUC7341/qP1vtyUSd++74ZutRnxC6OP1yxTTA5WKiNsmxhLJ5M3KW0eUI8vzIQgcS20DCulEgfXN2vHzJju7J5ddvyhbbdsGDSwQq0LGeKri0Mroqk8MogbbDA5PSFOdFq27a5XizXlqKjTi1Hx+TZDD+bxonUr+YCtBaNU3hXMg49hmdYY6berhHT+U1sfaYh3U+QwitUFMsnecJOFuq2ulyAXWBNel/EXFZkHahlU3MERGrArNgVShPFAsApnXIGsZ8HLJAAcAaMX47RHoJphYF33/sqB2Msj02F6YCFXkKWbWaVrWxsE+1bEqh1fd54EdxbTHbOEapN6YAJsE4TZ1ltuVV4SA4QDNFCbBUToUPtudpqksQEB1JzRDAEf6RyaRr8epQEIwiX6MfbzU36amgByn5ZySTrtf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(2906002)(16526019)(5660300002)(6636002)(8676002)(86362001)(31696002)(53546011)(8936002)(66556008)(66946007)(38100700002)(478600001)(66476007)(6486002)(26005)(956004)(6666004)(36756003)(316002)(2616005)(4326008)(186003)(83380400001)(110136005)(16576012)(31686004)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?LzVlTmI4VzdjeFFRQTc2bUMydmxtcWZsRTVIRittUzg4TVlyeGFxOXM5MTFp?=
 =?utf-8?B?b2pGM3Z2ZHNnUmN4bmt2SlRSRWlCUGxsYlFGOTRmR0ZRWEFaUEVYMjVwc3FN?=
 =?utf-8?B?Q0poUmJReGZ6QXJrSFc3dGdKdEpwei9IMUVLcUl5enVjSWdwRTVWMDgvM1VZ?=
 =?utf-8?B?R3pmcmsvNVJvYjBFdXVkQXp0V1lKUEpPaTFnbFg1aXQ0NWlRVndTKzlkREc1?=
 =?utf-8?B?ZHVWU01jMExGSDZFblEyTnEwRDBid2poVHVKQzdkV0JwOTJWUVBXMnZ4U1A3?=
 =?utf-8?B?T1p4UnlrZkl5NnVKUzg3YnNMZGtRc0xGVmFpeldQODFwUHlCWTBUdUFyb1U0?=
 =?utf-8?B?UzhoOW5VSlcrbktFb012SWFheXBnbG1xa2xUNHJIdkZVK3U0UWt5ZVdsZHFH?=
 =?utf-8?B?c0tsRjFaUFhBelpydTFBZnZ5Mi9VUE1LVkRwSk9oa3Z6emYvOWF3elpXTHNO?=
 =?utf-8?B?UHNyRTlLd0s4OEVCd1NBOEVFb0JUUzFmZTJ0ZUdaTTlQNXVURzdtbVZVWWJ2?=
 =?utf-8?B?UEF4SXBuVzFNUlRqZFdtTXFIWEp4UDhYemZQN3ozQ0dtMVFhbFk3emdvdGs0?=
 =?utf-8?B?L1AzN0N4MXBlNlo1NzdXTFU3bUM5VVpCalJjSXdFZGEwaklhNjJxOU11L1NI?=
 =?utf-8?B?WkQrbTdlZFZOYUxmNFRxZk0vbmJZc2p0N0NoMjIwanRwYVBSSjBQM1lOcUk0?=
 =?utf-8?B?R3E5MTViRy9TRkFuQ0JnU0p4TTNtTjIrQkRUQTN2OHgvc1R6a3EvME5XWjh4?=
 =?utf-8?B?Skk2OGFnLzFDRFhIUDhOMDJLQ01KZ3RtekNIbnVwOFNGOGlQbUNWVGFhUWt2?=
 =?utf-8?B?Y3A5am9YalZYdTBjT2dKUThENGZ1QW13ajhqazE5d0F3ZzFVbHJCYnI4Y1pP?=
 =?utf-8?B?V1k1czQwLzIvQkN1K1Q5d0c3Vm5wcldSY2lYMVFyT080UnFTSnh2NGVGZnMv?=
 =?utf-8?B?Z2FneEZFUngxaW5VcWFUbHcvWXBUU2EwaTZ5cUNLZkY2R2JpTXVXVGVrSGU4?=
 =?utf-8?B?WU5ITnZGREV1eS9temRFS3lnMjlibDFEZU9uN05HL0JPSWlERUxCZk1KVEJZ?=
 =?utf-8?B?L0JYZmI2SjJJeTVkVG9FTGFhK0NjaDVSdVdhMTVxZnJsd3NvdC8zUXBQQU9i?=
 =?utf-8?B?TitxWG9rVjhlMTB6MmppdllJNWxOa2tPSlpyekZDYWt5RHRXL1Z4THBISWF2?=
 =?utf-8?B?bjFZN1RIZkNjUHorRU5KeDFwczZoZ0hCVHBRZkpFWW9JK2ZwQ0s5Q1c1OHVl?=
 =?utf-8?B?WTRYdkZSeXNaNzlmUktGekFjUmRMVXJ4K05RSWV1ZmxKUEk3OGxBclFtVUJY?=
 =?utf-8?B?dE9MczNkMksxcEs1azlYTDBBSExkRFNzaW1vR3VLNlYwSGZKV1ZmdEFkNGdJ?=
 =?utf-8?B?Z1Q0QURiSzVTdk5aeDdNdzJvbGNFQXluQnhVVGwyL3BiVW4rTmdxTGdqakRa?=
 =?utf-8?B?ZVpFYUZKVmVRRW84S2hNWVBOb0lHdEJyNG12SStpTHVBKzc2RG5WL0tISDZh?=
 =?utf-8?B?SnpHd0JIYlU1WlRBUlVvVDFWZVZ3b1RiS1E1blhxNDVyRXB3eWVybEZtSXFW?=
 =?utf-8?B?QU1jYjVqTUhFTW1vbDh3c1JzckI4R0lLemF2bTh2K1RreFJCSTZVa1VDMzNI?=
 =?utf-8?B?d2dDTnN3R1RscFJBbHdZMW1IWDNuQzUvYldxVUhWM0NJWG1IYWxVUjlTOElw?=
 =?utf-8?B?cVpLVnZmcHI4THVacWlzb3ZGMzVWSVJteHFIWU1wdXNDR2M5TEQzek45c095?=
 =?utf-8?Q?ICw+r0tY89tk3fv02droGC/O7nKq0Zd4XdO/kff?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e344e03d-820c-4c76-0d5c-08d8ff48da0c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 13:26:03.6045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A02o43I3XTMoYtZjhURaNGIWCz7bEJdklT4mrDASwxdUt5mEZM1+kKduDgjYuPrVnsjJnLvxOcgElaefb7gO4v17iFZaPGdAZLX1hboLsPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4614
X-OriginatorOrg: citrix.com

On 14/04/2021 14:05, Andrew Cooper wrote:
> On 14/04/2021 13:57, Jan Beulich wrote:
>> On 14.04.2021 13:04, Roger Pau Monne wrote:
>>> @@ -264,6 +265,38 @@ struct cpuid_policy
>>>              };
>>>              uint32_t nc:8, :4, apic_id_size:4, :16;
>>>              uint32_t /* d */:32;
>>> +
>>> +            uint64_t :64, :64; /* Leaf 0x80000009. */
>>> +            uint64_t :64, :64; /* Leaf 0x8000000a - SVM rev and features. */
>>> +            uint64_t :64, :64; /* Leaf 0x8000000b. */
>>> +            uint64_t :64, :64; /* Leaf 0x8000000c. */
>>> +            uint64_t :64, :64; /* Leaf 0x8000000d. */
>>> +            uint64_t :64, :64; /* Leaf 0x8000000e. */
>>> +            uint64_t :64, :64; /* Leaf 0x8000000f. */
>>> +            uint64_t :64, :64; /* Leaf 0x80000010. */
>>> +            uint64_t :64, :64; /* Leaf 0x80000011. */
>>> +            uint64_t :64, :64; /* Leaf 0x80000012. */
>>> +            uint64_t :64, :64; /* Leaf 0x80000013. */
>>> +            uint64_t :64, :64; /* Leaf 0x80000014. */
>>> +            uint64_t :64, :64; /* Leaf 0x80000015. */
>>> +            uint64_t :64, :64; /* Leaf 0x80000016. */
>>> +            uint64_t :64, :64; /* Leaf 0x80000017. */
>>> +            uint64_t :64, :64; /* Leaf 0x80000018. */
>>> +            uint64_t :64, :64; /* Leaf 0x80000019 - TLB 1GB Identifiers. */
>>> +            uint64_t :64, :64; /* Leaf 0x8000001a - Performance related info. */
>>> +            uint64_t :64, :64; /* Leaf 0x8000001b - IBS feature information. */
>>> +            uint64_t :64, :64; /* Leaf 0x8000001c. */
>>> +            uint64_t :64, :64; /* Leaf 0x8000001d - Cache properties. */
>>> +            uint64_t :64, :64; /* Leaf 0x8000001e - Extd APIC/Core/Node IDs. */
>>> +            uint64_t :64, :64; /* Leaf 0x8000001f - AMD Secure Encryption. */
>>> +            uint64_t :64, :64; /* Leaf 0x80000020 - Platform QoS. */
>>> +
>>> +            /* Leaf 0x80000021 - Extended Feature 2 */
>>> +            union {
>>> +                uint32_t e21a;
>>> +                struct { DECL_BITFIELD(e21a); };
>>> +            };
>>> +            uint32_t /* b */:32, /* c */:32, /* d */:32;
>>>          };
>>>      } extd;
>> Due to the effect of this on what guests get to see, I think this
>> wants to take my "x86/CPUID: shrink max_{,sub}leaf fields according
>> to actual leaf contents" as a prereq, which in turn may better
>> remain on top of "x86/CPUID: adjust extended leaves out of range
>> clearing" (both are neighbors in that over 4 months old series,
>> fair parts of which could imo go in irrespective of the unsettled
>> dispute on xvmalloc() - unfortunately I had made that patch 2 of
>> the series, not expecting it to be blocked for so long, and then
>> presumably signaling to others that the rest of the series is also
>> blocked).
> There is no shrinking to be done in this case.  The bit is set across
> the board on AMD/Hygon hardware, even on older parts.
>
> What does need changing however is the logic to trim max_extd_leaf down
> to what hardware supports, so the bit is visible on Rome/older
> hardware.  I.e. after this change, all VMs should get 0x80000021 by
> default on AMD hardware.
>
> (A curious observation of Milan hardware is that it actually advertises
> 0x80000023 as max_extd_leaf, and has two leaves of zeros at the end. 
> I've got an open query about this.)

Something like this:

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 050cd5713e..d9eb2878c5 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -311,6 +311,7 @@ static void __init calculate_raw_policy(void)
 static void __init calculate_host_policy(void)
 {
     struct cpuid_policy *p = &host_cpuid_policy;
+    unsigned int max_extd_leaf;
 
     *p = raw_cpuid_policy;
 
@@ -318,7 +319,18 @@ static void __init calculate_host_policy(void)
         min_t(uint32_t, p->basic.max_leaf,   ARRAY_SIZE(p->basic.raw) - 1);
     p->feat.max_subleaf =
         min_t(uint32_t, p->feat.max_subleaf, ARRAY_SIZE(p->feat.raw) - 1);
-    p->extd.max_leaf = 0x80000000 | min_t(uint32_t, p->extd.max_leaf &
0xffff,
+
+    max_extd_leaf = p->extd.max_leaf;
+
+    /*
+     * For AMD/Hygon hardware before Zen3, we modify LFENCE to be dispatch
+     * serialsing.  Extend max_extd_leaf beyond what hardware supports, to
+     * include the feature leaf containing this information.
+     */
+    if ( cpu_has_lfence_dispatch )
+        max_extd_leaf = max(max_extd_leaf, 0x80000021);
+
+    p->extd.max_leaf = 0x80000000 | min_t(uint32_t, max_extd_leaf & 0xffff,
                                           ARRAY_SIZE(p->extd.raw) - 1);
 
     cpuid_featureset_to_policy(boot_cpu_data.x86_capability, p);



Only compile tested.  Needs checking on Zen2 or older.  The Raw policy
should have the real max_extd_leaf, while host and derived should have
0x80000021.

~Andrew

