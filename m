Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 441A64677A9
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 13:50:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237576.412045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt81Q-0007t8-TR; Fri, 03 Dec 2021 12:50:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237576.412045; Fri, 03 Dec 2021 12:50:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt81Q-0007qs-Pq; Fri, 03 Dec 2021 12:50:40 +0000
Received: by outflank-mailman (input) for mailman id 237576;
 Fri, 03 Dec 2021 12:50:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt81P-0007qN-1Q
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 12:50:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d333860-5437-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 13:50:38 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2058.outbound.protection.outlook.com [104.47.5.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-esFGO2z0OWyqmEXH1suymw-1; Fri, 03 Dec 2021 13:50:36 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2336.eurprd04.prod.outlook.com (2603:10a6:800:27::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 12:50:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 12:50:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM7PR03CA0012.eurprd03.prod.outlook.com (2603:10a6:20b:130::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Fri, 3 Dec 2021 12:50:33 +0000
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
X-Inumbo-ID: 9d333860-5437-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638535837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qe6yEJ+aGUWE6fZf6eyPC4snHVft0GIs90q8N6YOv/Q=;
	b=Pxqq5kf3bK+OoIN2SzPMsQ0YjZaRWG9vFD6dNAe5BXWTZ8cpKzuEVGQRo4vnJD3Re9rgIi
	Pt5DxdHUGKqDlHwmfD41zS29PrBUhhdzfhcX/GA6b/PJmQS7e8EEeOJ1eimqmRdTyi0lss
	cnC5DoEUoUEkyTXwswvtbLtEvzsNIQs=
X-MC-Unique: esFGO2z0OWyqmEXH1suymw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9t2NSFq11pJiWzKlqxf4USQJ5Ad7Xw+u9nhDRfAZ2x0f7bo4n5P3YpDy1wduyMbudScwjNyEzTuyd+oLd9h31ykaaEEdU4fXlZRfe/gGTle8CPJl2qhfXD2hSV+EuwLITAO7ZLpvz0ZmqJOqmZWFl/A4ZpNXjAsgmQ1MLuj+GRpBbJ8D2QVPmax2B3Te9Qy2vtjxQ/sr4t2VRg+17m2DFA0ZO8dQT9U3iETZ1gkYlz9FNiRaxiMEQmjwEE3z0nBseIJyS+DqMdKMX7w6J5nulpIZ7p/vziMv3w3cC2NlLEGSAtA/oNocwCT+7v3dZSw+QlY7f2W5qrwJgMliANU5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KrPc8cD+EJ8zaFM/6eDcq7gpUw2conBGCQOsCRVdOrY=;
 b=KnpdIX9uLkvCTRrvIav5axOrtCPwz0rkCDv/MGxfxSST+KQEEKLYTVyVDHuRT074TJtiorwhAux3BIaF7HRIYAZLFn0L3NEz3gxdwtdvmnTkFQOM4VbgdrX87niNjsv0wPzVebRrfRBG65FtIKi8QtkerCwBGUF+XMYKEvQQIGijDyUpE8JSyYzy1TbGDztte7WJ8tVabDFmtkC2/3nGqlJKN8uhYpUuWf2OcDusToKpwOmO6/3JRFaU0enxw5E1JnIxHC9FjxuUu+to5b1YF6hWi/k6kCb6+5xyEkoowU4F4Jfl5UO+L2bxHDjFUd5uPsHGj3joRr8lywtgvU3bzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0418bdcc-62eb-3d98-1c1a-6b1af0f75d00@suse.com>
Date: Fri, 3 Dec 2021 13:50:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/3] EFI: move efi-boot.h inclusion point
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <46de3a57-76d0-1538-ec3b-79290d1bfb70@suse.com>
 <8b369fc8-8f9e-c350-95de-790d47fd9aae@suse.com>
 <8413bd97-90f5-1b9b-9090-d9fd3bcbcc66@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8413bd97-90f5-1b9b-9090-d9fd3bcbcc66@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM7PR03CA0012.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29a1ed01-afb4-4c3b-a32f-08d9b65b7f44
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2336:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB23367B94C9F0B5247790D338B36A9@VI1PR0401MB2336.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SOUSBofXR2CH+fIiFA7SJucqv+7pYOER2SeI8z3zeGHpqGmpBV5SKZpaZ++qB3ID+1Bf90TCD7mvG4ouqzv8JKYaWulSMixMoE2HYSk/thDhwLTfG7TV6g3G78s0PAgvt5OotPz/fM4apyKWVXj2ppP/2p/p+4/zIGrxn6xlwjo5Qh1inN1biY7sGA4FBEVJ3FXocmYqD+2IlgrPi6Qf+bpqqRaK4Zbo+lIsk9TscQqAtYeJvhyP7dSssQOs5HN4JcANLWG03Cz/xM/Az2/z6FlVQeyfUz81sZJB55zp5xWv1iBvyXvZrJAxnY1sWZC6YEU+Dlm/+9EW5D0TK9R/DBPI276gBSKWT/K0LP70eLyn2T1GX0K66Bf12LFAWiFm5XKqPr3u3bcTiOSasRAVCpbjHiXGSSjenriw4jOnp8jVjerPVxvyQWxsp6JTsiNQtZEImGCRszfZ8j3YHeLU0/CYsy62MHPYdFvybPkNhYWD83hMzIr9AFvBxdT1iuGWqdN92hNHcm/kz7CjRnhtrRD7SNYY51Wvg+emF0ym8lomB24jTyRAspUCavZxH4Kk5Ufo1rzYNyxcflcu3tjFlyHIKN1zrv5rxUMTma3xOLQ1YUAeHrZBa1ZmF2lr42KFFMv0kpSZFD4utEjDr92qa+0IFDDVyBiqb4R1g8QKf/FpEcukLbNUIUX3wMjiTT+NJoaS0k4X+Gl0eYzu5cFirE9U4wjHGQH1Btubb5C2nBk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(316002)(8676002)(36756003)(8936002)(66946007)(31686004)(83380400001)(66556008)(38100700002)(53546011)(66476007)(2616005)(956004)(6916009)(86362001)(186003)(6486002)(54906003)(16576012)(31696002)(2906002)(508600001)(5660300002)(4326008)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2qmYH+BTe9cKHrQDrPXrSBTtpH31UtE5odv60QVXknrYD7FPHDyv9eCKc9Wj?=
 =?us-ascii?Q?2vDcVQDG44m5jkecvJGaMkI2fQef3xwyEbfcdAAQJnFDjKQTey3ZtBcQcS7n?=
 =?us-ascii?Q?Gc/fGtvCvgYP7Ksc8dveYLCa07lVUPBajs/gFpoKs1Iz5WWGCpa1VxROn6sy?=
 =?us-ascii?Q?pw21mdm2xbbfw4i1NnOPhmBnTRq+NAfopAp/IocXMA0Y164oVb45Kq45D2kt?=
 =?us-ascii?Q?FOyAEbdxeoFpLv3zQr6gpdducA+I703ty786mqL9lu/6vZpaG3jNSl5w8CGy?=
 =?us-ascii?Q?b14rq9I+qJdwfMkVlj6dNL70wSFNOOjyK1sp+qGYpz7d9WDp+ZYaCZhOJs18?=
 =?us-ascii?Q?1nQHCrPom9sqOX4E3w0+8WyAKIrjdBCP0WNze7uVW9Gv9SphK+xXIiT9iFCZ?=
 =?us-ascii?Q?/Klfmx5IzbyfPpKydkyC89EkRrj8/PKMnbp3rQL/vgYToGIhfhc+95jArpa4?=
 =?us-ascii?Q?BLqvnqOfv5jtskPI/spPujAaZZbF+RN+ie8JYrdSxa4J+BWBLuWZRDGUH23t?=
 =?us-ascii?Q?8CD8kYFu4XlvFji5D7rqBRhuQ8/+p0ItApIkFSYmr9t59wCc9+Ia3BIIpUR0?=
 =?us-ascii?Q?B8sjGzjNIVup2C7E8ii2h21EXgp7dEfHdz8uCXnsqawlQlIRd0OAb1uoWyST?=
 =?us-ascii?Q?Eie6QmHVTe3Nd4DJ3owOZ5ezBeWMq7Xc1R/R0rNSJtMFVz3SAOOcYhkMcnmt?=
 =?us-ascii?Q?1x9aDjkUWtm2UT9ieLDDIJiZVHPWXEisWYUIU51iLqv6uR0xofFQiN6pIPcJ?=
 =?us-ascii?Q?gIpjRyegQm88zhtq92uSxd9WziSZ2b2b+ndlQ4URDFAzKvDjTTCMSpfhrbZC?=
 =?us-ascii?Q?ulLX6LW8+6yveeb3nTkanvWwb8jkN+Fs7SVQzkC1lv8zznO39vAtEq2DlH9Z?=
 =?us-ascii?Q?MOIhlFLsfw/gUivUCx25zlGKopTWLFX886hTrr6srzBGoASidM95TrBpZekf?=
 =?us-ascii?Q?SP76mNkRS/F19SU0065ntFcb3gv0Wb/EgFQHJhjOuRlRV2YPpaNjHT9o7n1H?=
 =?us-ascii?Q?oo6DKqUY6XDZt04H9FqLbhv3wMPCgFmJMKxdrjHrOiHvFrh59kE94Wjax+aB?=
 =?us-ascii?Q?bw6F77l94EFf37uGK0q2xIdfuODO4IMyT0CdaPIbaYc64iarO9+Jtpro+yxS?=
 =?us-ascii?Q?358twUhMhQsB47ocFH8TXnLrbeIYRnsS9+tPu+M892VLseHVQ7X5XTbNkkvR?=
 =?us-ascii?Q?UDkrvA9ISqUcsrwl+wjRPe6g7NDgG3OjqDpWJ8pcm/dqxPFH9IwRcdOMcgJ2?=
 =?us-ascii?Q?xSXqZcpMczpnCN+dCZQquP0rUosNxJeVGMRVKowElajAOST/204ZbOnoyaNZ?=
 =?us-ascii?Q?Q47r0ux8331h74xhqrcPyu6RPwrL9wbDVN+7A/hMVjYERuyao3oa7XjpxdlW?=
 =?us-ascii?Q?ICIdNrfXbucjVRbyDU+NPnujLV7wqHruXgS9C8sBBMWehtPUocLKoc+RPu02?=
 =?us-ascii?Q?p4GPBAwskmDRVRp+6tBnJwoX1mgBbxrNF6S2aXjvJV1KhI9Jim0DSkfgwsua?=
 =?us-ascii?Q?Q1pQYeFkheBUTqpsgmTVkFymj4EGP0bawtsp8StEzCNrW1pyM7aMUJOiufvG?=
 =?us-ascii?Q?oEoZnNPNOWNua+JML4SXV0/ckRf4+4MhfQmILfVA4BIwE7oV9rg8T+qMBIxK?=
 =?us-ascii?Q?cL5ldx0YAYK+6tlJtYB5cJQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29a1ed01-afb4-4c3b-a32f-08d9b65b7f44
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 12:50:34.4728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pq700X23Ly8387rzftRrXr2fFAJa6si97rHtuzptgIt0v8lvWyfuc4J69xAImf3F7nDZ/yoljtEzrIDqJ1/m/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2336

On 03.12.2021 12:21, Andrew Cooper wrote:
> On 03/12/2021 10:56, Jan Beulich wrote:
>> When it was introduced, it was imo placed way too high up, making it
>> necessary to forward-declare way too many static functions. Move it down
>> together with
>> - the efi_check_dt_boot() stub, which afaict was deliberately placed
>>   immediately ahead of the #include,
>> - blexit(), because of its use of the efi_arch_blexit() hook.
>> Move up get_value() and set_color() to before the inclusion so their
>> forward declarations can also be zapped.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Why does blexit() need moving?=C2=A0 It isn't static, and has a real
> prototype in efi.h

Correct, but the movement is for the functions it uses from efi-boot.h:
efi_arch_halt() and efi_arch_blexit() at least (which actually the
commit message also says, for one of the two at least).

Jan


