Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A4F48D92F
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 14:38:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257215.441922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n80JD-0002lu-4Q; Thu, 13 Jan 2022 13:38:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257215.441922; Thu, 13 Jan 2022 13:38:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n80JD-0002jz-0L; Thu, 13 Jan 2022 13:38:31 +0000
Received: by outflank-mailman (input) for mailman id 257215;
 Thu, 13 Jan 2022 13:38:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fwfT=R5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n80JC-0002jt-A0
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 13:38:30 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1742448a-7476-11ec-bcf3-e9554a921baa;
 Thu, 13 Jan 2022 14:38:29 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-ZK09jZryOziM7YPkP12Ytw-1; Thu, 13 Jan 2022 14:38:27 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4608.eurprd04.prod.outlook.com (2603:10a6:803:72::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Thu, 13 Jan
 2022 13:38:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Thu, 13 Jan 2022
 13:38:26 +0000
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
X-Inumbo-ID: 1742448a-7476-11ec-bcf3-e9554a921baa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642081108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5SAC01B0FEJ9D++feTieb1kthouKar2LxN9uErJxwEs=;
	b=gx8MgAgzrT7DNZ65x4JimjGEHT+9xdSis9X99jnxD+YHFaKCLXa75Yu5TwFUZ2i5stn4LT
	ow8SGvffoGizg201klzDKueK8y3FxyqyQKlCx8e/fFXHbYSZPYyhusEakuckjkvXRW64B2
	cfAWtKWxGKEIAhY98YjBzHShJ61J/Pw=
X-MC-Unique: ZK09jZryOziM7YPkP12Ytw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nggCXW3cee/DBhwOWl5IUNrwJuT+D3ALBs47aiinY3J6msZmDU6rxHVoUpd6B7HtZBW5KVebd+HOTPtoqLN323VU/c1yaz2aKoPDA4RY2E6Mv1oUaBifiUTiSkTDVbJbcBaFliw64vH2NlkBGUoir03U3CVid7FedItgz5durtZSgcjOYZ3/D4hT5sUBJ2Pe6f0PJ8albk4T27JMW7cNFR38nU1Pq3Ur40CbN7PphPfJzsD55kuC7lNGudr4pGikSHVsXIxXqCoiTuQSY49yjWPiSKr0GH/8CUfSoIdWZz9Z51DiUUh0bgI1AilfRv20AjUPBTR02ZDFkz04D3x7zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YksEdwVnUi5xg4in3IpU4mJRqtQ3ODpEONUMzWG/egA=;
 b=eV9ZK2VkBHKmYNUPnBf7DI+O1VBz5pNT5y9JTy7UGNPrIoCzVtzgGxIw2/XRMcR15PjobJXLCU0AbTrWelOH5EvnrOEghZjArSf+DWe6nupxpbUShPeRcTb1Avyy+uNz/KOlj0Ng/uQJmaQfFr26poSeIxyGNb6ji9+PILnT6zFs5wfF18HaxBvcby1LfhbcLgZtpbCPO6iDFBKZ9B9Aq3FCXRxh9xYrmjQAYzsDIOgC3AyETY4PGjwdlnL3pMoJwqE9JRAaaWFp0PhoLdXy2rs9SBx8VG5eYknx2E8w44/c8/gpJpP2P4JWRE4HYVBHTffIsacgu2fHsOY0D/b+sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <410f27c7-ed38-c1ff-ec2a-2ffd32e6751f@suse.com>
Date: Thu, 13 Jan 2022 14:38:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v5 14/14] vpci: add TODO for the registers not explicitly
 handled
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Oleksandr Andrushchenko <andr2000@gmail.com>, julien@xen.org,
 sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, paul@xen.org,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-15-andr2000@gmail.com>
 <892d6148-e98f-def2-121b-922f1215a442@suse.com>
 <YeAo1sNve2iaJuzb@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YeAo1sNve2iaJuzb@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0301CA0007.eurprd03.prod.outlook.com
 (2603:10a6:206:14::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15af99ef-8875-4edb-35b0-08d9d699f9ef
X-MS-TrafficTypeDiagnostic: VI1PR04MB4608:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4608A5702D0FFC384B5C6215B3539@VI1PR04MB4608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zEOqyFFZgx1aKPcscFafQl5SR2t4l+7IAMtjfBK3j6jHdOFJAje+HY9XXi+AXnJrOSaV023aADFTFg5niWWzOiyBVV7jT9VvqjJG6d5YcTDPYDOR0Djl00f8VL8AdPjfOBrWAaYPdrAefOpDuiKxpL5f1ZNfSO3eX4XYKAZv1kpO6yqtVmBiDtTcJ4XRJ7xxCYwvQWLciNuXb2l+dOwpb646aNUzaenpkx3d7EfY0zlGT4C4PYZrezYXtY2A98+2lnZLsNVXG/tQ6576HeVqfrXo7WOX2JZn09RGbbJr/RXoGU9UeOwx2Q8AwXPd8oCoaqKQImCBr+5xIRPUaGxTbXraPcZ3k3Lf6IbLc+WwI15DUy9lhJeaRFi37DlBuY9HpEtV754WW46SDgcRfCf5Z/6eBXcwhdF1CiwcevFfnvPRqyMdKZ5FVQDY0K4+MbDxeWwEGZFimWyuTrqOaj55+uW8d9VTByrXYb74dhR0cvUpysinTketPurXgvwOC95qIhYqsGJDyCs2SZPUnE4TkyxcugQ9Wuh1REfHrQYxCmOBVMrXMFXNVc+DiheiIGd+7RWIJ75hQE2EWeXI5bdia2BbJEUy8G8/wtxs99y1IxXXWbQEnN5WhazH2gjewh3BHC6kgl0cl4Tw4Hs3cqGBkWzZfY28OfHKlAJwDR7Ruk09Pd2nKWP66cUj+JJ+x8u5ttobzq/5exiAoGEKWRM2sonTuZ7bKYLjSwOOGxONm3c6tJF6snVf0FmXneBQVJCM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(66476007)(6512007)(7416002)(66556008)(8936002)(6666004)(31686004)(54906003)(5660300002)(2906002)(508600001)(4326008)(2616005)(31696002)(83380400001)(316002)(6486002)(36756003)(66946007)(38100700002)(53546011)(186003)(26005)(86362001)(6506007)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oLKpq8ATXhn6JGlE1A9937tD+iVbF0UMkEgPWXDMjGuIpKnq6D+V03bZsGIz?=
 =?us-ascii?Q?jzEW1MDNh/Ljq4FaRWCzE1kzkhwBVaAYlc6VYXkkWSqlQufIe9NQPCowGPfK?=
 =?us-ascii?Q?bvl6ST3pTzM0hjOgE7xh4aWWiiFodFKu1P9w0Qp//MZMZdy9R9dJrN9g8i3n?=
 =?us-ascii?Q?/4K4YoViUZ5z7vuzY7BbBhKZ0mRKx5rRi9cDj8hPMN949ZCLVL7DHK6xa3nl?=
 =?us-ascii?Q?wpa22nbJOxu+dCNlIgX2DuP85sj12y5zYOQSOZ3mCsVHIJnAlioIBAnwaudI?=
 =?us-ascii?Q?3fCHlDyzlf7W+FWv/6AriOUzj2i39EL8PpsD05+cbCsOk7oRSYKENP84j8Yu?=
 =?us-ascii?Q?LxJevnSFBGpL77i5hGmdwEiVNgBQN52z56NQO3T4QJHq+LwAjjdSQGmzVq+S?=
 =?us-ascii?Q?rcoW7PLgzEsSKghXuwfMWLT+EEaLyvA9Eh3njKptOcExn5Qwtmscy6zD7GHD?=
 =?us-ascii?Q?aH+9ZeI/a3bCRVvGScYppc8cGYEwRsN2bLsr5quxoArMN/BpRWJt7Bo05vqf?=
 =?us-ascii?Q?ANbYSAQ7FgZzX9azxsYe8xPxIQbZtmv7z6lm1S1a06eDMrwptEu/NNGclxIs?=
 =?us-ascii?Q?zXLVQozv+w/SoZEFBGD7A5EmrWjYJOyMUfDZ6Cm5CV+fJzSyz0QCbI8I685T?=
 =?us-ascii?Q?H9eqHCeoaNrnue646c8o09XpOx8CCyRYDEEZTW2zWsBdgxboTFCHiEH8dGbY?=
 =?us-ascii?Q?s//bxpDjipb/3q+TMDf8TXBO21HRVKo4soi/qIkSV4TioDXidkDpY9dgK0Xi?=
 =?us-ascii?Q?XjkGBdtRxe1NanJVPhJcpUis+OMTyWu7dH/SMMDPl7f4xQ7TOmtwaUB1+J0o?=
 =?us-ascii?Q?grFVsnRQuRWbro/rgXGCmXvgIcP6MySjpstvGg6FIcIWZeCiFSwsnPAD1uSh?=
 =?us-ascii?Q?jo96oIrHIMB1LldHxsOzwkBxXvzwnwjxxCsv8/V08jJRmYGJKJJaR3+3ZWzJ?=
 =?us-ascii?Q?SDaZL/2khNcrm0PwDAVLLbF2jdgcVQP21GjAPSQzZLMw5PoOxek0zEtOkoPs?=
 =?us-ascii?Q?Jgl+pOuve7D225WEui5odrqeZYeN52avDTfKZiZP7EWC99w11MwuLuxQWN5B?=
 =?us-ascii?Q?ae1KmnWyypryDb+7gj6kDmpXURxnVGxPNsfD7fbqNrCIi2CI65d35kJJZbEr?=
 =?us-ascii?Q?uyjNdjegRPCf8g/cFZVb6IhXm5uvPFMvvJhH/lCSXa+4zOTxhh83ihr5u7Eq?=
 =?us-ascii?Q?BUF6EpqIIJqaTgMUdSoht19almTQDrrKP/NPqfX8YsXeCDFB5HQ5XQ0lIGlC?=
 =?us-ascii?Q?65QZq8d8IW3qXjtdfBepEkTUocwZcQzL5C9Du1cbNICwJmGHOX9xTpyLCHaz?=
 =?us-ascii?Q?Cvgl931e0LVadEAYjULdna3gZh9BsHjI2BLvMOgVc/S03EA59pivKAX6i05Q?=
 =?us-ascii?Q?7S/T4DMvaYZpYLeXVn1AqoVA61bs4IVrjsEHrZjBLh/PxbRAyZa9imqp7rXy?=
 =?us-ascii?Q?jyARIdB0dMyqgIJkdsc5P8sUXlPshvC6IE8BAWmNkQTTPsnSsreQZuZnWtsj?=
 =?us-ascii?Q?vpV1nmgbxubKQrEsFbl4MEaGB5xTGZhdBFzLqhgeA90xxsxv9Zg+4NYw2uk9?=
 =?us-ascii?Q?+AGNTupOhaGX3iNkf9FZ4vMVXlkMT/1w1QmdDmaYxzMoQHwpi5EVvdbFasL0?=
 =?us-ascii?Q?H6tcueWjCK8+zbc7ow3LVcQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15af99ef-8875-4edb-35b0-08d9d699f9ef
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 13:38:26.2419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zHBq13dv+dDdq27iSrAym3VRFAmHSPHnq4lfOg3e8naz6W3q5z/9vNggFSpy39Cf7z7E6IYQ+PahgP4SXdrKcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4608

On 13.01.2022 14:27, Roger Pau Monn=C3=A9 wrote:
> On Thu, Nov 25, 2021 at 12:17:32PM +0100, Jan Beulich wrote:
>> On 25.11.2021 12:02, Oleksandr Andrushchenko wrote:
>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>
>>> For unprivileged guests vpci_{read|write} need to be re-worked
>>> to not passthrough accesses to the registers not explicitly handled
>>> by the corresponding vPCI handlers: without fixing that passthrough
>>> to guests is completely unsafe as Xen allows them full access to
>>> the registers.
>>>
>>> Xen needs to be sure that every register a guest accesses is not
>>> going to cause the system to malfunction, so Xen needs to keep a
>>> list of the registers it is safe for a guest to access.
>>>
>>> For example, we should only expose the PCI capabilities that we know
>>> are safe for a guest to use, i.e.: MSI and MSI-X initially.
>>> The rest of the capabilities should be blocked from guest access,
>>> unless we audit them and declare safe for a guest to access.
>>>
>>> As a reference we might want to look at the approach currently used
>>> by QEMU in order to do PCI passthrough. A very limited set of PCI
>>> capabilities known to be safe for untrusted access are exposed to the
>>> guest and registers need to be explicitly handled or else access is
>>> rejected. Xen needs a fairly similar model in vPCI or else none of
>>> this will be safe for unprivileged access.
>>>
>>> Add the corresponding TODO comment to highlight there is a problem that
>>> needs to be fixed.
>>>
>>> Suggested-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.co=
m>
>>
>> Looks okay to me in principle, but imo needs to come earlier in the
>> series, before things actually get exposed to DomU-s.
>=20
> Are domUs really allowed to use this code? Maybe it's done in a
> separate series, but has_vpci is hardcoded to false on Arm, and
> X86_EMU_VPCI can only be set for the hardware domain on x86.

I'm not sure either. This series gives the impression of exposing things,
but I admit I didn't pay attention to has_vpci() being hardcoded on Arm.
Then again there were at least 3 series in parallel originally, with
interdependencies (iirc) not properly spelled out ...

Jan


