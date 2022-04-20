Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1603B50817B
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 08:51:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308905.524799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh4AW-0007ii-Bm; Wed, 20 Apr 2022 06:50:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308905.524799; Wed, 20 Apr 2022 06:50:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh4AW-0007g8-8t; Wed, 20 Apr 2022 06:50:28 +0000
Received: by outflank-mailman (input) for mailman id 308905;
 Wed, 20 Apr 2022 06:50:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nh4AU-0007g2-Tk
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 06:50:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 285027fb-c076-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 08:50:25 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-75cnCcgePSm5fYSNI15k_w-1; Wed, 20 Apr 2022 08:50:23 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB5838.eurprd04.prod.outlook.com (2603:10a6:803:ea::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 06:50:19 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.014; Wed, 20 Apr 2022
 06:50:19 +0000
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
X-Inumbo-ID: 285027fb-c076-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650437425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2eJBJARYiDwISEluRGDzmWVzhkR1YAnlnbvDxmm916o=;
	b=Jyf+LXGSlAdlPqIYwMwOwsAqriYF7AiP/1b3tgrg08zJw7cuuUKG5jWLnixUM4qYrd3UiB
	GM036OaNzJsaV7Bmjg+OuU0Nmv1YKL9plvaWO7J07FvUqYB0yVjVqYzzxoNrwJQEyxcV31
	D+03xKhxGhia/zfH/xxhUO9EDCTYqpE=
X-MC-Unique: 75cnCcgePSm5fYSNI15k_w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RXvG7LhPFgNvqXgK8tTQM1nzPf6KGTIDyZOJBmgAUyouksZcFOIJL8ojwjIGnvDmwcikF8j3m1fDJ2ctxeh9yLrlqW9wSSY6H2gvkXGhOHS2nGrSg6yFuS3GWiEoXlV0oRgYuiUIZsncFrnAJ6vpOWIHBx4ZQ0QyK1L9LSk+QD0xqP/Yn9jWbLQwZoawDgYE96KB9vIX4PlXZKDqzkl5dHDGJWYf5wnVz7CS75pjbO8yfIusFCenPRfJEYZHtn41Xf0Q4TooYGVVWm4MQi+Jy1O8LuA19iVP0RRyZPuyOFYfEuwhOx4XnWDrWBW6fKPhKj91skvAex+5RoGHjCStaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2eJBJARYiDwISEluRGDzmWVzhkR1YAnlnbvDxmm916o=;
 b=g43X2wjloWReYRVnpPUvYD9cWg48/dMpbILv3KT7ekDbgpAOHM6GN8pUkx5GDluqkmChROSJEMBWC/rh0eNyN4fl4vCk5cdUzpZ2nyuVMOQEfGm/sxYnOqVmgLpy49z3TPcR3g/4tHRYGTxU1VWwH/hmE5gbkzTH9kXTMkKkqiJ3fkA1VQ6+FavQCJHHH6NeFupn9HkyNu9I6Hwo0fNpyk8HBp+jYdiWpQz+BGHg1oolxRPPA7Sa4HhR6BlJtpXLj7Xz+j60Z+b5P+9KSIh19zrF4KkOkfW2HeMd83UjepBNOq1eGrboQorUgWoMtXhgj3v7/Mv3utDSEhaXGZDR/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7a9e02b5-e24e-0b55-e52f-0e45e41eafc6@suse.com>
Date: Wed, 20 Apr 2022 08:50:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5] x86/vmx: add hvm functions to get/set non-register
 state
Content-Language: en-US
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Nakajima, Jun" <jun.nakajima@intel.com>,
 "Cooper, Andrew" <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Pau_Monn=c3=a9=2c_Roger?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 "Lengyel, Tamas" <tamas.lengyel@intel.com>
References: <e57797cbc2c0706c03363cc7fa1b3e234921fee5.1648214955.git.tamas.lengyel@intel.com>
 <CABfawhk-oCAoz-99LOaOYKD-N1FvRnFvM9_AUCgsPEF16F=VCA@mail.gmail.com>
 <BN9PR11MB527672E1BF038742F290A7798CF59@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BN9PR11MB527672E1BF038742F290A7798CF59@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0023.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::28) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7511caaa-8258-44e6-2330-08da229a08a4
X-MS-TrafficTypeDiagnostic: VI1PR04MB5838:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB58381AA384B81FF3C4CB0D5BB3F59@VI1PR04MB5838.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JXX+BqPyA3ZVh7zQxSjcH8GTsJa5SxMa6G9anAfLFl8yQkt6HSPf5nNDyO8sNyaRDGMg2u9OmKWt1jbS2a2dI7B7ktTqW9XwiM0o9pwQdNWNVX0V9qZJ4qnb+yndzKnQsKc7Q1IOMmnjmh5VboVFWYtOeNvDICOpUa3MKa9G48op/niZmLOjk3zIKNDwDDmqdrgSFUYhJBvB3lNimWv0tUotLCYshYO2n8CZ6l6Dm5Tz2DMIB8sagD57HT2I3feZeg/ODGkzXhaazpNjhplPFpK0i3QOWnGK5JGTB78urO+LPvAb8RebHVeDzij00Jq8aGA3p7phlf8yJwCRnS9UpbWHWFSnYq+qe++au/uu/uQrlNTEL1utkRV1Jwl7Ulc0J/Xvu6KjjI4AXgotpqyPDDHtbdoaepJ/Ea9El28cVfX6Jz/ngmIGI0guc3OJoj6JWjiTEkvzsDamgJSN+/s49DRCwe2B214B7vBiWYz/6sGyejYilpHo4nciCdnZ/EgC9Z3wEFA9SR1+bCHB/O5+4uZY5DVwhPIwRHCixe0ZpMYZDrNGEZkFHmmbdyMuFlIihK/J5k5kJDQ071TtHyPBxPqfdMkw3830H7hwt02mbRWtXP9Bi4B38DdHWgz41iufblGZ7GDaeBLrX6MEMhxuVHwLCLNR4sH0wpy3aBa3Xccp3P7ET/LWQi11RCmq5yEpN+y4gyBeO59zYAUyhrWIej0XLE0MTdAF4pG20KlXoxIWdGiTaX/89v6U4fnQ5Wnv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(38100700002)(316002)(31696002)(4326008)(8676002)(31686004)(2906002)(66556008)(66476007)(54906003)(66946007)(36756003)(5660300002)(8936002)(186003)(508600001)(2616005)(26005)(6486002)(6512007)(53546011)(6506007)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHJya2M1RzlsSXcwMTNRVjZlTW5pN0ZueklLMnVJV2xoMGY4L0FWa3JmUWgv?=
 =?utf-8?B?NzJCN0prZWtteGNBM3c0L0E3Z3F5TzA0alR6NWF3T0RQSzlZb1NjbEpWdmNV?=
 =?utf-8?B?YmpjWitOL00vY0wxVldmbzN1VTVoM0wyeTV6SEJ6N2oybnROS3NhTXJHeERP?=
 =?utf-8?B?Vlc0QzdmZ1lYaHRYWVRWSWhFbitDbDlVQnlYdS9nVjVsdEVENTBKSjYzbjlT?=
 =?utf-8?B?OU92SDhVZEF3cHNvb3RyTEZwY2tYYzArN1drUnFNbHdvYUhWdS93TlUwRXU3?=
 =?utf-8?B?cElJT1JXUktJUDNtdHorODlTb3pWbW03R1JqdW1TWWx6SE43b0t3NXdoU09q?=
 =?utf-8?B?Z0ZIT0xzdnd5ZEtpdFJkL0lBakdCc0k0OFJqdFVVdklhNWJZTnZsemErSHJ4?=
 =?utf-8?B?SFcwSG9yNzd1eDd4ZFdCV3FnNlFuYmRNSUJHZXFwNHlScHRjZ1VNQytPLy9y?=
 =?utf-8?B?RWFZUS9jRE54K0NRM2tDVmFCd0lVOUdwTkpidC9rRjkxYzlkbDhVVGdDZ2Vh?=
 =?utf-8?B?bGN2cm1xdVdQVE42MDN2UURnNXNSYWZJL1BUY1BqOUV5Q3N6dllsblVRYVRy?=
 =?utf-8?B?UHQ0eUVaQkFhTFRXc1NNUVVmMVNGUVA5eGFETnltWXlhdExENTZUcS94TVp1?=
 =?utf-8?B?aDVMenVFOXhidysxNmRKUk92YlcvdWpoWVg5bTNXNzhXa2t4VTZONXdHdDJ3?=
 =?utf-8?B?UHppcDZxRisvY1cvakdDL2d4dTg4RUtLeFhMWXVBS0hiaWttemd0cHpoRm9x?=
 =?utf-8?B?TUVCb24xRUhtT3JhTXJTT3EwTDZST2ljamdTdnhNVzJUTHc5MURyTjhIRGY5?=
 =?utf-8?B?cUpack95UlFUaXlsMzBsM20zTWw4YWZlOXNXaU9RUldxejFSWnZFQnZFeWtq?=
 =?utf-8?B?aWZ2NlVBYlJCbDBybDQzM09qQ3ZjY2dESGMwMFZVUnJsMmpiUGdlOWFDZERl?=
 =?utf-8?B?VTVxRGtZY3B6K3BMWlMzZ0h0NTJGTnBzRkV3cWlvMnRKcWw5THNuLzB1Sldy?=
 =?utf-8?B?aUxTS3lZcW8vSkdjcU9YSFV5eE5xVXBwRC9zdUZmZkZQU2wvZllTVmFNUnYr?=
 =?utf-8?B?SGhJbDIrd1Fud3c2OFRBczA4RjNoWThtcEVCTmsxT1BPcVlkTWR1dHZCczhJ?=
 =?utf-8?B?WktWL2pxcTNMSmJEdXNid1ZlYjZvaHNucVN6dWhuTmJscHhHRkwrK3hDT2xW?=
 =?utf-8?B?Z0JCTHh6NmxPY2dOZVVyVzZyZDlMb0hNZy85aGFma2tEMHhjMTZWeXV1a1Nx?=
 =?utf-8?B?d1JUYlhPUDFIdExUM0ZhSnhTM0tHMC9RVjZ3TElMSEhiS2l4NU4ycjNmTzRi?=
 =?utf-8?B?ZUErQ1A3WnR0Mkc0dGpyN2RNNnk2VnpzemNnTTgxdVYzaXJkR0V0RXNQMTU4?=
 =?utf-8?B?bW40SUR2aGRaK2VIbG8rYlh5OTlvb2xNQWlJRWN2VnMvZnlwQ1FjN3M1eU1v?=
 =?utf-8?B?ZmRPY1NOZlhpUCt3ckgwM0NZMWZCNGlZVDA4czJ3TDczTWlpZ3BPYVQyZURP?=
 =?utf-8?B?aHVwcVVRbUp5dGJhcW4zK3ZVdTZnd0JWNXNUMHRuWldLcjdKODUvcnNHc3ZX?=
 =?utf-8?B?ckdwajVrKzhKcUxLNHBNMUZGSFZFbFRlS3MxZHNRUUxJWGU5QzVTZXJwMFBV?=
 =?utf-8?B?NS93Rnh1M1R3WGRTdURJOWRZR0tqMXdUMlY5SWZmMDcrQnFtU0s3TEVZcCtC?=
 =?utf-8?B?UHpTOWNWaWcxV1drQ21FaHlrTkdPM3M5YmtlaUtCVStLS3VaK3BJZkNrWGRR?=
 =?utf-8?B?eVlJNHgzMzE1OXkySExhQW5CNXd0QjExQXBqeWd1eDJhT2FQVGVJZW5MVXQr?=
 =?utf-8?B?a1lGQVFBd1Jza05HZlFobzZBcG9uNXNvREQ0OXI0V2ZLalRhVUdQTXdINk1r?=
 =?utf-8?B?ZU1HRlBxbWtvNzFZSDFYRnUzQmVYZnBiWC9tK2FMcjJkOGVEcFd2WVFST3Ez?=
 =?utf-8?B?NEk4c3JoNVV4bTQ5SlVsNENFVzk4bXlnejZ6eTVGcEJxRDZmTnB1emplblQ3?=
 =?utf-8?B?czlQazI4SmR1TE5HNXlyazhudVhEM1gzc3d6TXR3ZllRa3VYV0tQZ2pHcW16?=
 =?utf-8?B?TzVTczFhOWJMbHhFKzJSaDNpV1NJbDBqYkc4QmQyWThlZUg5RmVqS3pWL0V0?=
 =?utf-8?B?OTZlY25VckZiSEZpN0JrRFpiWjErTWdGQjRDOVltaTI2b3hjdEtzcklnc1Ar?=
 =?utf-8?B?RzRvc3dIVVZZMnlCS3FDZ2Z4dnd1Umt6dlRPM1BBazVEQm1YNDVsUFlUdFBs?=
 =?utf-8?B?eTdHN3VGTGxhdUdtNVFFZ2RqdzZZdHFIei9EWG40aThJeGFiRHlheFFYS0xR?=
 =?utf-8?B?VkVpY3pSc1Qwb0QveHAvdndqcEIrVVFyKzQ1QkNoQVkzN0hUbUUwdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7511caaa-8258-44e6-2330-08da229a08a4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 06:50:19.2878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJ9ohq7ayBuz3c/tbFGN5uGxHQ8I+FcP+Q1qImWtoqYCszhnk6OqS4f5l72W1DeqIKLyIEWhEkONKRgxy8I8CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5838

On 20.04.2022 08:39, Tian, Kevin wrote:
>> From: Tamas K Lengyel <tamas@tklengyel.com>
>> Sent: Tuesday, April 19, 2022 2:43 AM
>>
>> On Fri, Mar 25, 2022 at 9:34 AM Tamas K Lengyel <tamas.lengyel@intel.com>
>> wrote:
>>>
>>> During VM forking and resetting a failed vmentry has been observed due
>>> to the guest non-register state going out-of-sync with the guest register
>>> state. For example, a VM fork reset right after a STI instruction can trigger
>>> the failed entry. This is due to the guest non-register state not being saved
>>> from the parent VM, thus the reset operation only copies the register state.
>>>
>>> Fix this by adding a new pair of hvm functions to get/set the guest
>>> non-register state so that the overall vCPU state remains in sync.
>>>
>>> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
>>> ---
>>> v5: Switch to internal-only hvm funcs instead of adding to hvm_hw_cpu
>>
>> Patch ping.
> 
> I'd like to hear opinions from Andrew/Jan first. Obviously they have
> different thoughts when reviewing the earlier versions.

Well, I certainly would prefer if migration was taken care of at the same
time, but I can understand if Tamas doesn't want to put more time into
getting that case working. Plus, aiui, this solution to his problem won't
prevent the eventual wider scope change to be used also for the specific
purpose here, perhaps by simply fully replacing what is being done now.

Jan


