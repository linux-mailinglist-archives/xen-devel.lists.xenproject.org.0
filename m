Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6DA3AAE57
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 10:01:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143721.264752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltmwt-0003Nd-Bd; Thu, 17 Jun 2021 08:00:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143721.264752; Thu, 17 Jun 2021 08:00:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltmwt-0003L0-8D; Thu, 17 Jun 2021 08:00:27 +0000
Received: by outflank-mailman (input) for mailman id 143721;
 Thu, 17 Jun 2021 08:00:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k/hY=LL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ltmwr-0003Ku-OM
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 08:00:25 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89f7646e-446d-4b77-a5d0-4e536b3a58d1;
 Thu, 17 Jun 2021 08:00:24 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-wVyxjQ9RPv6h5x_i8gpiDw-1; Thu, 17 Jun 2021 10:00:22 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4606.eurprd04.prod.outlook.com (2603:10a6:803:70::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Thu, 17 Jun
 2021 08:00:19 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.019; Thu, 17 Jun 2021
 08:00:19 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0003.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.7 via Frontend Transport; Thu, 17 Jun 2021 08:00:18 +0000
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
X-Inumbo-ID: 89f7646e-446d-4b77-a5d0-4e536b3a58d1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623916823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jiTgbx2mu8DbI/5lQiyzCnV3uep143WJcQXwYHB7zAM=;
	b=m0/0V3AzEO3bvwwziusGccsPnqMsSf5KfuiPP+EvycdRtroaI+2uvd2GFRo+pnOVB34KTj
	k2S06Z8FOPSCfr9jzcNoktc7MXSH3gS7KyBLY7ukfxuGZKQXaKsr4MMAIq4EL8GnDtN69S
	uGLS4qTQFwIxe4UvbKp1miQoehP8ifM=
X-MC-Unique: wVyxjQ9RPv6h5x_i8gpiDw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ci2ojKaN8dZFEXIMo1q3B/jKvrixvsUEnfZz+aQdQidwbMmoSCLySs1ZopGgHgkgwRE85AeSYT7S4qcYlFgyD5dwyhCwQONsB6vk754+0pybF00sWNe1GnhuUG1e6FuCr9QNnkPFmWg/YN3CwpBA+DPOR4BYA6xjzqeYOU/oVnDnoRFP7oc2i+J65Grp/mTy5qKCOzM6DjCiaohqpdHj3Uy1wsD9dGM1At19zL2UbPf66cENvz3ssBX37ql1GCP4TZhnDNPOArwtMks1OmysqaH6qtZPjakRr2pywopKDZXxYhy1yyyVsiu/TClXfpq+u5FsC3OttmfvFXdX3YomhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jiTgbx2mu8DbI/5lQiyzCnV3uep143WJcQXwYHB7zAM=;
 b=BNy9Fk+Dpm67YdKGsgXHeiwkv5qZgFx24I1VVjQIl6Q27QXQFQ/I8RbRm+MfGP/xghEKbhIzjdm1KmwtHnFLxfSFeN8U3jIhLAbm0sfhUudBHq585UDKuE2yOAcBWwzNkuza8KprwaZ5Plu0h0tbiozXUSDaeDi2K9AKmg2AspHaqBtXyIXDF8oiAWHUcgT4GMMbBs2KuZ2xp+15AQoKDWtyHgEdWpSR538S4HOGfHUOdETM1qLd6MMSxAHdcWm8QRx2CjvpeqH/0jW8ykyc8p3buClTDi7L3pHH1YuTraxh3sLAl12yJNwd+46wPRhXZdLAYwR8Ymgh884rH6LC+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=suse.com;
Subject: Re: hypercalls with 64-bit results
To: Juergen Gross <jgross@suse.com>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <71b8a4f1-9c18-36e7-56b1-3f1b1dabddd6@suse.com>
 <2adfba14-8adb-89d8-3e8b-a25aef6fc2d6@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cf751696-5c9b-b465-67d0-544245d8563f@suse.com>
Date: Thu, 17 Jun 2021 10:00:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <2adfba14-8adb-89d8-3e8b-a25aef6fc2d6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR3P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 663db20e-9d3d-46af-249a-08d93165f34a
X-MS-TrafficTypeDiagnostic: VI1PR04MB4606:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4606ACC9365569514FC73789B30E9@VI1PR04MB4606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T313y+74LPXJjwrDh8k1LlcdDHUguoVHBqowv4lOGYrjmQhekoV2LLYm6k206phZm6Y6EqgZiAKcV3mCOpMHrsetolSpxQl8lgyKIP+mlmOf9N0zffCeR28LvmJp6dWCwDA2XBUdIx8v4eDHqMAznQMSCdLukmAoqkoVKJmAorpfSEqPvpLXatcTdPGTOAw98nrwC03oZ/7uovMuASrs3EYVHxTzb/OmWfVEfrhtDiEXp/CDFW/n8S08vWo0Ta47TxciCz72XA+7IruaRleKptJ6p+Oqthwmu3zpFKL1Ucy9/2foYX8ogaPzseCrOzUq0WBPWGeJRqxkOkLzvgGC3id5mxu3UKD272Y+37g5TpE/Ayc15Ot5t3IwEQdxkk0GQPCKND3MjO+bbrtSWZMgAKUP8RuxsRGBDEFFSihyok91Z+S+7NEACRY/F0O9gv4Nkwja3aWYaXM2+SxEUGfXxwr2Srx/HmqY1Snb9YzQWebutHIo42cAyWDtU0CkHTjYkqYStsjGQMdcox2Ssn5KTBfEy7MfkEz8/17ziA313XI8qob7dRtO9EUawbakhHz6pKCblz/eiB7lHv0mwlBMdAkkdi40UMKL/gYxGaYsKUTht2zY748jsOzpRixdrkPpojNofng8t7EC8f7HZGjJOngyS+ycxskCr3+caHyXHSYZYw6hmXYPfqawFKby4SPn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(39860400002)(376002)(366004)(136003)(478600001)(66946007)(66556008)(66476007)(16526019)(31686004)(54906003)(38100700002)(316002)(8676002)(186003)(2616005)(6636002)(26005)(8936002)(16576012)(2906002)(5660300002)(37006003)(956004)(4326008)(4744005)(7416002)(6862004)(31696002)(6486002)(53546011)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWhuZXA0dFpNVTlDRE5oMkpkYmxKR3dCdmk5K0xWa2ZqdUQvbjE3RWFLbDdT?=
 =?utf-8?B?RjFESkNYSjFCSzhNUTlKZDdaTnJ3RHZMbTBlSzZKNzRVRERMaGJJSnBIUlB3?=
 =?utf-8?B?ODR4QW9Tb2diZXZtNzhub3IxRDBmanhBbkdwcEJndVF5TmxVeUpSOUxQNXFI?=
 =?utf-8?B?OG1nbVhpb2tXWEpLSldMUFcrZTZySGxRVlNEWDB1ck5VSkt2N2h1WDZqWnR6?=
 =?utf-8?B?T3JneVJkK0t2OGp3QW50L0F6dnhLcUhFc0xCekRtRmFJQ29YUFIveDdwcHpI?=
 =?utf-8?B?R1V0b3JvNFMrakpvWnhXT2hpZHVuTURSa0FnTnhvT09QMVlzUkF2L3VKT1VG?=
 =?utf-8?B?dUxBT0EzSjltOTZROG9rZVRSSmRZNFJpTTl0YjhRdVFFa2hMc05kS09qbmVv?=
 =?utf-8?B?SE5TRWtZQWt6OHRoWjVESHRDRnV0bHVWZGlEblR1UWJzM01LaUFqcHQ2aWQ2?=
 =?utf-8?B?aXRpaUNHQWFkaGxhVWNMbVE0dXhkTmZUZVdvOC9oejgrcFUvZjUxQUN3Tk5u?=
 =?utf-8?B?SFlMMVU5UGprV3FRV1FiSitqLytsM1QxanhhTytpL0RNc3dsQzBpdFZLb3VC?=
 =?utf-8?B?U0pnb2poUkd6ZldhWmlBY2ZhRGxiRVNQZ1FRTTNGTEdqRGZIWmI1Rnkya2xT?=
 =?utf-8?B?S1puOUhraEZwaW5wZnZ1cGtwMjc1c0FLZE5zMnNOWXd4NU9nVnhXTjVNMHZY?=
 =?utf-8?B?SlQ5alNTNXpOZUxUZGVGY2JQQlp2VmNZenhKZkkzZ1J2SisyL2FCZXBzVHBi?=
 =?utf-8?B?S3J1aDkwdDF4a3V4SmNCbXZMWFBlZ0I4L25kZERkcjd3SXNYR2R6WEd2bG16?=
 =?utf-8?B?dlhlNjFKRTdJNERpN25hOG96ZldPSC83MmRjcktyeGtSSGtQdUFQZXI5QjA4?=
 =?utf-8?B?NTU1VkJpa1RoVjBURDRsYzFXa0NlZlJ2dEg3cFJGaklzaUREd3JFZzMxWjl4?=
 =?utf-8?B?eFI3ZDBaYkRvcFNpNURkMEhtSGtLcElnTHljU1MzeFM4Yk1wc0FjbXgzbHlO?=
 =?utf-8?B?UnNXMEdxN1B5MEtLT3k1Tk5Uc2p0aG9CN0E2L3BheWQyN0I1dVkydWg0Nlpp?=
 =?utf-8?B?VVo5WDdVZDhuQ3hvMFBwbElxakYreTRuNWVxbzVDSGpYWlNxaGk3NmJ0M2ZU?=
 =?utf-8?B?eXZkemNRbytzdVc0QlBncWVYRG56TklVMlRnNW9BYWdKclhITFhseUNZVHNY?=
 =?utf-8?B?WHR0bFk3U04wS3QvbTN6OVIzdDg4SklpUk1jLzBjWHNYUG9oYmpkWEZRV0JD?=
 =?utf-8?B?YkV4Qzl4MDJISHBzOTRwYXhyRDBwTUpSWUNaOGpLcmdKVExEajlpV2ZSaEw0?=
 =?utf-8?B?UnkyKzJIYVV0c3BVQnd5MGVLRVhzRlFnU3NuaDNzdjFhYlUwRi85MVJrS3N6?=
 =?utf-8?B?clVhVE5UYXpGa01ZaFM5Wk1zWWdrejRyVm5PVndySHJXSGxpdjdaSGw4OEo2?=
 =?utf-8?B?bVNUQWJPc0JHeENzRlhxc002Z0JNbm9hdWJXS3VqNUxDeTNrdHlBSnQzbDVV?=
 =?utf-8?B?ZlEvcFRFaW5xa1VBcnRMaHhqa2hTQnVBU3hNSzZPNE9TTURnSEppZW44Rmh3?=
 =?utf-8?B?S0lXUExvTWVIenh5ZWlvbmFkNzVDMWRlalVMU0tqS0JHUHRNdzNZQjZBUGp3?=
 =?utf-8?B?ZGI1ZkRZdkcxOFllWXBSekNRdkg3UDRHekw0RHpUVWQ0SzFSdG9SRXZUTnhu?=
 =?utf-8?B?dldQUjd0cm9qZG9SQzQ4MVBVelQ4UjVxMnB1bm1USnNxdS92MHJQU294d3FQ?=
 =?utf-8?Q?yITpjN9QsnJnY39TbDI/VTAgf62MkSgNZzB6Nny?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 663db20e-9d3d-46af-249a-08d93165f34a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 08:00:19.4285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ct1Wx2oi97MkMZruT9xKg1+H722AvLuwkKjnJW1aKPACpXKjg+0GVM0BAJFjYxqH4961MuwcIM9iBXXsb8FBvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4606

On 17.06.2021 06:55, Juergen Gross wrote:
> On 16.06.21 18:04, Jan Beulich wrote:
>> Since hypercalls from the tool stack are based on ioctl(), and since
>> ioctl() has a return type of "int", I'm afraid there's no way we can
>> deal with this by adjusting function return types in the libraries.
>> Instead we appear to need either a new privcmd ioctl or new XENMEM_*
>> subops (for those cases where potentially large values get returned).
> 
> I think we can just use a multicall in libxc to wrap the affected
> operations.

Hmm, we might, if we're happy for these to then not work in HVM domains
(PVH Dom0, which still is experimental only, or PVH/HVM DomU-s using
the libraries for some purpose), or if we finally wire up multicalls in
the HVM case (there ought to be a reason why they aren't, but I have no
idea what that is).

Jan


