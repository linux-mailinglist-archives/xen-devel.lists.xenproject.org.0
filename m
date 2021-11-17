Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 129594544C6
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 11:14:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226707.391859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnHwe-0000TV-DS; Wed, 17 Nov 2021 10:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226707.391859; Wed, 17 Nov 2021 10:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnHwe-0000Q3-8w; Wed, 17 Nov 2021 10:13:36 +0000
Received: by outflank-mailman (input) for mailman id 226707;
 Wed, 17 Nov 2021 10:13:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ayfn=QE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mnHwc-0000Px-3n
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 10:13:34 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04705c7a-478f-11ec-9787-a32c541c8605;
 Wed, 17 Nov 2021 11:13:32 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-3-0A4r5O50NHiE0B0ertWQKQ-1; Wed, 17 Nov 2021 11:13:31 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5597.eurprd04.prod.outlook.com (2603:10a6:803:dd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Wed, 17 Nov
 2021 10:13:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Wed, 17 Nov 2021
 10:13:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0100.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Wed, 17 Nov 2021 10:13:27 +0000
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
X-Inumbo-ID: 04705c7a-478f-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637144012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OCQ/QzpTqOIKLp1pBx8paecAmrROgusf5Bv7gM0fHn0=;
	b=TQLf+JGpj1ub8Ryn4nqw2wdIeS2kZz0fDYeFwKyHAoIG1HMH/pzg+Xsk8yb9JADPdv6Cse
	FLMJyswg1Ivl8iNvtgJNEfMSfs5Qp9Vd0aIwcJMvdy/nGAiYOHst6Iq+c6MTkrcxt7mJyE
	j/J8mw02xB9/PF2MaHQlJkc6XuPiCaM=
X-MC-Unique: 0A4r5O50NHiE0B0ertWQKQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SGTBJyVjlSt0tmKAMAvE8jJagdCjWfUwIxYY5iWSuWsMnJMK4iWQygDFcsVogXFaR3x4ZDWSOr0RF9EhLidxNTlxUXUb+AUTac8jRCfXyAG073h3fba3YEe6n3Rhi/wrXNow3stIfTD042+fNZZY0D+3qxnM6emYZwlZD06w/n/yzzz5oYVsWuIYPl132DqnxDMSVv3HL67rgYxdxWrPfZ14w2p6prkC7YiiP6c0HhF7ZrTsQe6Dkd9MztAPv9Njpe0JfFesbs/e7FBPGz/I7QB3cb5vV/3ZhimKUTu2v3q2cHYwkJUPnhwLueCWiLGJdfnQptIivH3GMXiUgUAzlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5AV2r+Tz9iMhR9vqiGN1HI9l9TcbDfXOWoBFwMLJwY=;
 b=mDqcVrPotXDSYezrfbT8Txx/pLhucBeyE6Tp6wh/oj+r276Mq8xYMzQ/A781RaakWHzLINb61pTV7O7cC5nUJLJoKcSceQbLBF5bD16BoJjAVPGyIFrG72XgIcScZ6HJWLT3dDKvm7GOLb9xo4qIiknj2Mp8J8E9X5K+Vr+bJqkStpNAUFVfkQZASO0MON8sAHnwdQSswLOBZxVpROQnihjr8m+DAHI7ytKAmD0ebfymbrQHW/7PfO7SVBey5lC6NVFYzn1tDq+q9XfVbHxsm+9JkhWZIyIaRAOrrbE23HExDNSmNq9f0wYmqRdQm3+5eTRxAp20K3Ub0tTMYp1Ekw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fe31a1b4-8c66-701d-f951-6426fa72252c@suse.com>
Date: Wed, 17 Nov 2021 11:13:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: PCI pass-through vs PoD
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <b6d598cd-c244-2b7f-c731-fe839df3382e@suse.com>
 <b62a87ca-b68f-76fd-51c6-114e8b8e125b@suse.com>
 <YZTDkNRY5pMLFUR6@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YZTDkNRY5pMLFUR6@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0100.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::41) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd567f4d-3d3c-4e85-547c-08d9a9b2e65b
X-MS-TrafficTypeDiagnostic: VI1PR04MB5597:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5597F2F3C5336E90D84B9694B39A9@VI1PR04MB5597.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NfpOr9R5x7ukpwhzm/IN33bcYrvdr1oMyUj4IpEyloE/je8q8QJVFNrr11QyisJTKN8EthioVhusoErhOEpn9YPwFFgJpnQ+8atiDBozePlSFhQZ3gGVjwL62G/S08hSUutByKPuSQolwwxtZUG16iRzMSwpBPIR++QvBNzopeKLyZ6gSb82nescG6SFCQ/xsViAVzt+MTh5gt1YpbiPospBqm3eQUCD+bIgIMLO89VOHgn126LaKZv+ydOQeINIv9UJzPoh8zKWFj8VydaPIEYXtV9mKVefQIWiH6U6RMIPdXnv6V9pI6UYLpw3f7j2ZczZZPlzNcVOJvT8S3mtCoCojIDLZHuWriWk96AoAhz+/5h+U11+YYESYsVw82l05ufGCuNnag9RF5RItfMPoeNOCvpCn/G1foOI6jPJxKoJ2PWF0K2mtcIZzpqUzti45KpT9s7DpBdWLUNUJsbZ9CmZF2UM5zgLZq4y7hR6afpgHCmDigN1mld8KeufIWYaaDZNPbVy0bPyd5LdisqfOnmZjGtdppSeOzHqS4l96pJZUNMo9KDGApWP848pZdtH1hpTARTWa1n64QZRoZb1frascEp0sX9VqPMSDe+3O8sX/fCW5zSFY8WCYiCY+VUAXXiXruz7k9wBpm4g3G7jsiDbIwrj961HSP0A/kWl7btsyo9gf4cLHFAmHk+PWkTXp5QcXOprjhbzSE5El9DM2qa4BAmefe5eSdqZwY9m+Jc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(66476007)(26005)(4326008)(66946007)(66556008)(5660300002)(186003)(31686004)(36756003)(6916009)(31696002)(2616005)(83380400001)(2906002)(38100700002)(3480700007)(86362001)(316002)(8936002)(508600001)(16576012)(54906003)(6486002)(8676002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SvmRKecpq6lrJnqirK59q8RqM3A49rETxcIC2Jjmz4MePybT7Hcwci/X3H8L?=
 =?us-ascii?Q?i/cqLjxp4Z/0mJWeXNDClv1WPSCTMoTNftDnz09629g3KuwYAleWXHwB0QmI?=
 =?us-ascii?Q?I70opZsKyLWzjmqPyTw0j7off75lcAlIdlqG7dubpHtCXoRJ6p/lhHKuMjpS?=
 =?us-ascii?Q?bzAB77wG7Otnd0NupDMJBqD6ECDsvj3t/MgBfxiYWzD1I+s2x07b9YD/C+O0?=
 =?us-ascii?Q?WaWA17bBIfEFNgByDrENvyINfjwi4zY+Xrgf8LSctcdci1TPaJAtL3iokqFy?=
 =?us-ascii?Q?cBe7dTATOpGiCbwSHY/TjTWIQlqlJhOJkdUaScI7uGFZHDrOcnAVve95IUQd?=
 =?us-ascii?Q?nBtz6jcFjYRNQFyOzZwIJPsVal6HIdpNEI3T7h1ihzNiUusouSAAg2y2+jxM?=
 =?us-ascii?Q?8gQKbYIViG3ZRMV1d8KvX2P8PLfnWNK4Ag3whISAX8TEHnj0bfGpQ5/5GXHS?=
 =?us-ascii?Q?3p9GrOXlsQL1Xbo4BSPPIphoCfTCBQt5lb4kx85ztkLCM2Lo3wxQesZPVP0r?=
 =?us-ascii?Q?n7oZYspg1fwO42fLr3voQ/T7vRKmTesQygAliI8wOZxAxEGahNj5gva2jf++?=
 =?us-ascii?Q?l3ptg9k4F5Br5I2W9fIkalwiU1cEKZrvPujOLaXjrn1BfKI1iywlwKQB5fsu?=
 =?us-ascii?Q?RF5yvI8BFkl9PnICdQm1hwbXm8LIIM99i9h37jg6i7gc4AoRVYOYqDo5AR6x?=
 =?us-ascii?Q?4TwaSIF060Tlj7HX07SQEV5KDif6kKZjJ3zT+NkA1Lf4vgaMjLjLNy6G6puw?=
 =?us-ascii?Q?7BgqmDiobcmCMRc2EiMAd7Kqyth09pYZj1Nqz/mo03WV7EAr2NF6s6m5YVm8?=
 =?us-ascii?Q?L7b7OH9I5jD/rqxxls0klGeLrx3yf4syluz5leA1ykgDWIXOSinuFGe56mgQ?=
 =?us-ascii?Q?rrXzyXia0bzpfeuKwyB2uAoFVwZiKSqjmaZGTfVnIWFeLcdoARjFCxXz4wRg?=
 =?us-ascii?Q?MVc8geZJ3DqdeLCQBkkBzwe7W5ZW+mPONkyB91HFMg78I9ZV7SbsxSu50yDs?=
 =?us-ascii?Q?ouLiX4f/9Yj4mrr6THqENxD3XW5qtoyku9bjEKUc9Mnjv60T/WZ9mXeGsjrc?=
 =?us-ascii?Q?vYI16X38hFmQRO1nwHzXzr/78koaNyvkIqAVns0x1LyvcOHGYfKTr8Veo9UF?=
 =?us-ascii?Q?uHZV3mK59cS6Ch/YuzyV+uj9akDvWQeQVp69JK9+edRZGjDaY8ELr6B/pbGs?=
 =?us-ascii?Q?U9jhMz5MES5sWYZied8dOtJmMQjXwCw/KTid6u5PBey0j5WkC7SwsyxDEs1x?=
 =?us-ascii?Q?fE5nhSCTSCX3mmzyWgFeIrPXoy+cbegYfLvESMNQh4TbMTkcIVDKFPXSTa2H?=
 =?us-ascii?Q?m5LqisxibxlIcSqo9XxPi9R7PjG7UpRM4ek1vGD3brnZYUKr4by5UCXUD+Da?=
 =?us-ascii?Q?T0l1laOJmyxqjxUsg04dK983yq475o8ZMnaJhfxzV1A2bW7fXaGlDPYY0SyS?=
 =?us-ascii?Q?64PnxpO+9XY8b80IpxKPGT4p98wyIr4SDtRhjCR6kn0IooxcOkPwm0rgCOA/?=
 =?us-ascii?Q?pTASZ5KUZnDMuxgz05H5cyTdBqqvJKm/0qiMdl6uA8DePkgm2BkgM/qdnBBZ?=
 =?us-ascii?Q?xZS0sr7khih1gH3PlBUC+hU7DfXY6YkXmDv9hDKORJYqNs+yQXBSISPruOb3?=
 =?us-ascii?Q?x63cW0osWHuWju7E+4kn0k4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd567f4d-3d3c-4e85-547c-08d9a9b2e65b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 10:13:28.5352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ps3OmovjDg7bbbls9RxqTNRjHFWAZ53BiuvliDSlqKC5UPyfEZCvi2V1NFT51xb4AQ9UAN2FUmSzGH8TUQdICg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5597

On 17.11.2021 09:55, Roger Pau Monn=C3=A9 wrote:
> On Wed, Nov 17, 2021 at 09:39:17AM +0100, Jan Beulich wrote:
>> On 13.09.2021 11:02, Jan Beulich wrote:
>>> libxl__domain_config_setdefault() checks whether PoD is going to be
>>> enabled and fails domain creation if at the same time devices would get
>>> assigned. Nevertheless setting up of IOMMU page tables is allowed.
>=20
> I'm unsure whether allowing enabling the IOMMU with PoD is the right
> thing to do, at least for our toolstack.

May I ask about the reasons of you being unsure?

>>> However, when later assigning a device to a domain which has IOMMU page
>>> tables, libxl__device_pci_add() does not appear to be concerned of PoD:
>>> - xc_test_assign_device() / XEN_DOMCTL_test_assign_device only check th=
e
>>>   device for being available to assign,
>>> - libxl__device_pci_setdefault() is only concerned about the RDM policy=
,
>>> - other functions called look to not be related to such checking at all=
.
>>
>> I've now verified this to be the case. In fact creating the guest and
>> assigning it a device while the guest still sits in the boot loader
>> allowed the (oldish) Linux guest I've been using to recognize the device
>> (and hence load its driver) even without any hotplug driver. Obviously
>> while still in the boot loader ...
>>
>>> IMO assignment should fail if pod.count !=3D pod.entry_count,
>>
>> ... this holds, and hence assignment should have failed.
>>
>> IOW this approach currently is a simple "workaround" to avoid the "PCI
>> device assignment for HVM guest failed due to PoD enabled" error upon
>> domain creation.
>>
>> I'll see if I can find a reasonable place to add the missing check; I'm
>> less certain about ...
>>
>>> and all PoD
>>> entries should be resolved otherwise (whether explicitly by the
>>> hypervisor or through some suitable existing hypercalls - didn't check
>>> yet whether there are any reasonable candidates - by the tool stack is
>>> secondary).
>>
>> ... the approach to take here.
>=20
> I think forcing all entries to be resolved would be unexpected when
> assigning a device.
>=20
> I would rather print a message saying that either the guest must
> balloon down to the requested amount of memory, or that all entries
> should be resolved (ie: using mem-set to match the mem-max value).

But ballooning down alone doesn't help. That only ensures there is
enough memory in the PoD cache to fill all PoD entries. The PoD
entries will get replaced (resolved) only as they get touched. That
touching is what I call "resolving them", and what would be needed
for assignment to be safe (for the guest). Expecting the guest to
do anything about this is imo not very reasonable; it can only be
tool stack or the hypervisor effecting this.

Jan


