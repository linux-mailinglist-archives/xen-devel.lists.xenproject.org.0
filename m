Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 745D74FF080
	for <lists+xen-devel@lfdr.de>; Wed, 13 Apr 2022 09:23:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303936.518418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neXL4-0007Rh-Bq; Wed, 13 Apr 2022 07:22:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303936.518418; Wed, 13 Apr 2022 07:22:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neXL4-0007On-84; Wed, 13 Apr 2022 07:22:54 +0000
Received: by outflank-mailman (input) for mailman id 303936;
 Wed, 13 Apr 2022 07:22:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aogm=UX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1neXL2-0007Oe-4P
 for xen-devel@lists.xenproject.org; Wed, 13 Apr 2022 07:22:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 865dff32-bafa-11ec-8fbd-03012f2f19d4;
 Wed, 13 Apr 2022 09:22:50 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-e2_FnyIDM0qbHJXqIv41Xg-1; Wed, 13 Apr 2022 09:22:47 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR0402MB3827.eurprd04.prod.outlook.com (2603:10a6:208:3::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.30; Wed, 13 Apr
 2022 07:22:44 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5164.020; Wed, 13 Apr 2022
 07:22:44 +0000
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
X-Inumbo-ID: 865dff32-bafa-11ec-8fbd-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649834570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jUYyNzsxVhsXxldtt1i9Kgkz6AJi3M9+vK2OYehpZcQ=;
	b=i0rbP59d/TkRI/YMUA1/CtnSJ22cEZcMrqHDCH9apez5AIZKsCoPdlBYzRYkMeV7692wWu
	pKqu2gtwvRYwerWU6nZP1dGYyrhmyQB+0W048gm5HwxxFGd4909s26aw6iV16YxkPb1DRo
	xIUpkNpAcMYaok+OF1s84uDnHI/h8qA=
X-MC-Unique: e2_FnyIDM0qbHJXqIv41Xg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YSLkRzqVgY6KSY+sGjc/ZklS7Ta3RUfg5O1G1C2RNCdzEoilxB7+ocoA+hGHvHfnmfOTyJ5M0Cs/eOyDEsDMdw90JnjQfHRmhm4hLiD4Ib3MFfz0e9HTWCg5MqAFJqpTYiaaZZIYEgGJvwhLvYXcQvjcvl7oVZbG4iCmZVghvpirlph1iO65I0GoEh+pkTSRrZXexmQ43OnjHoGRq3He7fzn2ZpeZI+ip0o6Jk9l7Payuer6xwvbi3kBrXix1Qpcjla6up/9hc385z/I1qEHoO+k5hF8Uz30v7iVLWMx7cUD+2iK7OrmrebmkGbH88/0+qqgQV3Og0Eo7vBRmhyyYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUYyNzsxVhsXxldtt1i9Kgkz6AJi3M9+vK2OYehpZcQ=;
 b=hNRIf493KU9nkLhFDVN7+Ddg8t5M2zPPfBgMlYPyxUebO/9tKL4bdMjBy8PMca64Wn7gtb2FQEVmP4HF+cXrDUHzStOWRzztXzokOgyql396u7Gdw2ejwa+tsyMOve6hEBZH9DlS9YqrcTPWTZ3bfI0kx/q+byNFtUM+t9hHDK8cGIizrSoA9iEtc6HwzAGGmE5Z9qxI4gjMyKsDMnlybnXDlka7X7kqVCb1vLFveNXzxFh9NhFLMSRz2Xm0dyoyFMPYXZMHoRfhV/kfUDKoZaOhiKselyC90vysUodVGTTSzW7Ea0XoDpKJi4vUUzRsac1uDWbXrKINfKJgtbeIKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <13f077b9-6b61-5737-1c94-b17da0fd6ecc@suse.com>
Date: Wed, 13 Apr 2022 09:22:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v7 4/7] xen/cpupool: Create different cpupools at boot
 time
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20220411152101.17539-1-luca.fancellu@arm.com>
 <20220411152101.17539-5-luca.fancellu@arm.com>
 <8ddae5ff-120c-0097-bac0-2fca7a57d022@suse.com>
 <86F93995-5CFD-4A43-A928-E9053B027722@arm.com>
 <50dc64e6-1a89-59aa-e087-d80aad1c653d@suse.com>
 <alpine.DEB.2.22.394.2204121616030.3066615@ubuntu-linux-20-04-desktop>
 <39D59E80-A4B5-4587-9A2A-1D5F06C8C33E@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <39D59E80-A4B5-4587-9A2A-1D5F06C8C33E@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0177.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::32) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c386d6f-f27d-4e11-4c1f-08da1d1e66ec
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3827:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB382781FC1C6F8AD524331B36B3EC9@AM0PR0402MB3827.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aW82+BKXjGXBP113US9L5r0NRDRkAmSSehZhwl/srZiFv5xFXqVvognB7McZeKFBxK7L2LHHnGP71lE7t9VySzTq/u4RNtjRckqXFN42wKnZdUDQVNDIKq3TsQuIHti9IQjYShA/43VA9Oh+dBOKv5bVAsFzIMqWTPHA9SPNjr6kQCKhSiz5wH1uuQq8Xw57/FITvTX/6Dp0x7wVlyw2OSbw35tgq+gjXeGYgvnwXWce+ge7/EiRiALGophvCDOcPL0GeD6qrMQMdqnOyK7PJPKdDMJkoJfgTXdru7Prg6pKR3qUlplnhyzr4BBvCj6f8KQzF+3zuwUIg0iaGdY27RUoIoDbP+a7feFOmeZJgX10ZGHKr7oSFGOBqopcLAwHzTX8iRMhJTWY55symTTOt0Mm9Y1rZIoh9dBC0a7TU/aSK1X/Gevq/QPX9fLBs8PTelos6N2rM94lfl8VpEtlCJFqZ0nW/JNGnc11gD87Fw1b2MWM7sBS9ONcbXT6HzFfM3tOYuXQvWLbUBPfTQ+kBq58JxpjIy6zgxMyQv4zbxvf+TNU5H2dob5eROm0fjPfgNvTa66S6B+H+pmRi/NiuJdh0svsoY6cKWkK2G9Zak7I9/pYC8aIYPg87fo/yebv9WYKeBgf7aPl7RUIMXNbN90o7w5aNmEL3hC8j7ZyZsVp2Oa1nCdDYOEK7m5R81fH7rgTO6Fo77VWZuGZTVqSEGaWKfBOY1yJXgMBJ2xe8d6glKiFFryBkIy7X6qzkner
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(6512007)(86362001)(31696002)(53546011)(316002)(2616005)(26005)(6916009)(54906003)(5660300002)(66476007)(8676002)(7416002)(66556008)(186003)(4326008)(508600001)(8936002)(66946007)(38100700002)(6486002)(2906002)(6666004)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzkyVmFqM21OSjl1YXo4T0lyeHprMElPMmJJRlJQS2QvT2ZIR0MwblJXTUF3?=
 =?utf-8?B?MytINkZpMkhHWGpJeER0MEdra0RuV2U3UjJzZWh3alJ2ZzZ5ZCtyQzNVckdB?=
 =?utf-8?B?U283KytmRUUzdWQvWnFtWjg2UUk5ZjRiME43ZVpXVFNMTS81SllLTWVRMXhU?=
 =?utf-8?B?T20wSUd6NWNoQkxHVE12L0JZenhsckxhNXFvcVNwS0JjaGVzMkZWei9BOW9V?=
 =?utf-8?B?U0xFTlM1eEUwQ2doSmRpelUvc1RsTGhReStKSEdySzRZd2dZc0VQRmwvSVBT?=
 =?utf-8?B?YisyQmVZcEZydVZRMnFEZVhrTzdCUGZJK2RoNkNwQjErcUZPcXpnSkd1YXow?=
 =?utf-8?B?Y2pzc1AvUGlwcTNPUGhqQllvc3VST1lNS2UzWitQRi9BSUZJMi81TmlPZHNK?=
 =?utf-8?B?L2tOZkZlSTVOMDA5UzBvM1NMMFF5c3ZmNE9tSUdmdGFkWnNXaG5IRUxuc1Fz?=
 =?utf-8?B?VUN4Z1dkU05hVCtQNDlabEwvK2owS2RBcnd1MEtzYVB0L2pha25ZUFV0ajBk?=
 =?utf-8?B?R1JkNWRNNW1FL24wRUg1Z0pkcjROSEpvKzFObEJnb25GVDV1cVNpYVZ3VDli?=
 =?utf-8?B?bXVQWjBlNkpHdjlUOGUvQ1ZvNXE4MlNuSVlocmxZSmNzZkprU2lnMVdVMEpG?=
 =?utf-8?B?YU5JMTRMSjF0MEM0RjFySUhJYXFBSllrd3NtbXo4NmJVWVhMRlJibXFoaCtM?=
 =?utf-8?B?YWcvL05EOHZjNjN0S1kzd1BEQ3l5REFtczk5SVVGRkZTQVBtT01zRUNCYkRL?=
 =?utf-8?B?WnBIa2VzRVd5ZGNRRG9wY20xMTM5dTdab3IwYmVBWERvUzN1bzROc2E0VlVj?=
 =?utf-8?B?ZWdmNFVodWFaVlVuZTlrOWVGeVdabDBwaVpqa3B3RnQ5emx0cHZzdWhwMXds?=
 =?utf-8?B?Q0NzSUIxU3pObFpVODR5b0R2bFZhTWV3anJFdE5YK2NLTzBVWEMwWmJJcFNC?=
 =?utf-8?B?T1FjWUhWRVlhbU0ydTI2UVRDVDlwSG5DVzEwSXVzN1ZmbHJuMHg2OERwYVVr?=
 =?utf-8?B?TEFDWU9ROVJ0Y2xyandZSVdBdGM2Uis0YWowVmdMWklac1JycnFBTitmYjFp?=
 =?utf-8?B?TXRMcGZNVHgralplSWp2OHRzNEIrYnI4dGxwbG9iSmxveEJ4SnNDcFUvOHdM?=
 =?utf-8?B?ZWhKVGtYVTZYSnZYQng0NEFsR1I1cHI5dERQOWI0T3lGbXdQbmNTeklmUU1D?=
 =?utf-8?B?TzcvSGszWTNFL3M4MStqYkUvc0VsY2JlL2N5SVZFYU5Kb2czL2MzVW5uRG16?=
 =?utf-8?B?VXNZV29PRWlGbGZEcHNpU3hESW9xM05sU3N0aWo3dzhkTFQrSUVnaTJiejZ0?=
 =?utf-8?B?RUhRUUlqRi92QXpVazlzWkFNZEE3LzZhcVdLWWN1bENxOGFRcExGb1lNblpY?=
 =?utf-8?B?VjMyblZBbjJLaDd3a1hZcHYxR2Fic0ZDcmN5bkRGZTlzSG11SHhRQVFXcitJ?=
 =?utf-8?B?Ly8rdTM3ajF2YjhqaGZKbWZ5UFU0VHhBVkVncU14Z0RwM0FIUjZoZSszT3Yw?=
 =?utf-8?B?MjdEMkxaZEhIUlFmcXkzWmduLzBic3VOVlE2TGh0VGNWRUdNVFl2ZFpPTTlC?=
 =?utf-8?B?NlBWZHNjUGdLV0JvWWxVVDNSZk1TZG5ZcTZBRC83VnNhZHVTaHpMaTF3NjZp?=
 =?utf-8?B?bFZURG4vaDJrTWx1UnVaV0d6QXFoQlpZRnVBSHNzTjZMakpBSjZ6bFZ1R3N6?=
 =?utf-8?B?cHhoNTRvNDM5S2pQSWhadmhncUhTZ2NDeXVGRldqVGZjSTg3czZEK1BVVzFa?=
 =?utf-8?B?V1QrbTVmMmtIWmd1bEVtOE1SNytUVjRXcWhkYU05SERwZy9LV0NJaXV6enpo?=
 =?utf-8?B?Y0EwRitwZWtNTy9MY09rczhsMHJoaGRPOHB3QklERnJHOFNkU3N2QXZQZ1lp?=
 =?utf-8?B?ZGszNmtQdVBjYUJRNE5JcGVVKzM0elJOa3FXeVFLOGVWY0tOVEg2QWVwUVRZ?=
 =?utf-8?B?TTV4MnFCb2Z6MUlocDNiTmhyWXQ1RDJ4c1JmcmVlV2ZhOE1KK0JWaVBEenhL?=
 =?utf-8?B?YThvSVB6VXFOTm0vWUFKNnFBeit5anRxeVRDU2lPczVjdnY3b2x1MFRpQXF4?=
 =?utf-8?B?ZnZmV2JzVEVwdVJJOVByZ1JLeUZQWndxWmxuVFpjWU5vdzcvQlhYd0JLR3JW?=
 =?utf-8?B?M3ZNVmw0NjBtaDBzZVRlWkNXK3I0dGtMckJCb0E4eGZJMmdjYWZSU3N0UG8y?=
 =?utf-8?B?cXJZSHFibWxVOWZ1cGtUTmVVbWl5UXFUakdmNXpGdExSZEFweFE3cDVERGt6?=
 =?utf-8?B?SjRCdDF5RGtnMGRRQ1k1RC92YzNhNXp2RUFSUGhMSUVnNW96blhjZ0V0ZjJQ?=
 =?utf-8?B?QVl6Nld4SmRoOFp2aCtoNi9mRWJGQkRoamZWamJ3UDhzbklSVEtUQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c386d6f-f27d-4e11-4c1f-08da1d1e66ec
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 07:22:44.3226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/OxM6wdXuAqydOgLu8AYU8A9jTfhw2PrD1kSPNUYk7DT1P2Ky706+KvsPcXopxhmAKkBflc/CF5V/s7t2jLfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3827

On 13.04.2022 09:15, Luca Fancellu wrote:
> 
>>>
>>> No, I'm not suggesting a new menu. I was merely wondering whether the
>>> Kconfig contents wouldn't location-wise better match where the
>>> respective source file lives.
>>
>> It could be in xen/common/sched/Kconfig at the beginning of the file
>> before creating the new "Schedulers" menu, e.g.:
>>
>> diff --git a/xen/common/sched/Kconfig b/xen/common/sched/Kconfig
>> index 3d9f9214b8..f6545f4e9b 100644
>> --- a/xen/common/sched/Kconfig
>> +++ b/xen/common/sched/Kconfig
>> @@ -1,3 +1,10 @@
>> +config BOOT_TIME_CPUPOOLS
>> + bool "Create cpupools at boot time"
>> + depends on HAS_DEVICE_TREE
>> + help
>> + Creates cpupools during boot time and assigns cpus to them. Cpupools
>> + options can be specified in the device tree.
>> +
>> menu "Schedulers"
>> 	visible if EXPERT
>>
>>
>> I think it is fine either way, so:
>>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Thank you Stefano,
> 
> Jan for you is it ok at the beginning like Stefano said?

Personally I'd prefer it at the end (still outside the menu), but
really the scheduler maintainers are going to have the final say.

Jan


