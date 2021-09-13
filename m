Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A93CA4087B6
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 11:02:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185569.334272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPhrE-0001CE-Kg; Mon, 13 Sep 2021 09:02:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185569.334272; Mon, 13 Sep 2021 09:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPhrE-0001A7-HU; Mon, 13 Sep 2021 09:02:32 +0000
Received: by outflank-mailman (input) for mailman id 185569;
 Mon, 13 Sep 2021 09:02:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mPhrC-0001A1-Mp
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 09:02:30 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 528647bc-1471-11ec-b3a5-12813bfff9fa;
 Mon, 13 Sep 2021 09:02:29 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-37-t66PcaNqMCuHbM1Nt2dvmQ-1; Mon, 13 Sep 2021 11:02:27 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5471.eurprd04.prod.outlook.com (2603:10a6:803:d0::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Mon, 13 Sep
 2021 09:02:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 09:02:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0056.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.17 via Frontend Transport; Mon, 13 Sep 2021 09:02:25 +0000
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
X-Inumbo-ID: 528647bc-1471-11ec-b3a5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631523748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sTR8Hjj3qMeZkeQi25B8ABEAW7smRJgU/E3oAa0eI4k=;
	b=ngjkxpuLO6imWO6w5kDkmoXNV0aMf93AomsYzMNIXmfustxUWrxU+0EfzkrOAaxPW54Z30
	CTfb3rZI+HaHArZScIDmR8Sc2rBzf9gHCXNQm2iwz8M3OXRmLXVFgNFn3cHM6EKccoKm8H
	ynNBWeOmLGdVB9ARp6BxCdiqqXHG2pg=
X-MC-Unique: t66PcaNqMCuHbM1Nt2dvmQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IntaMR7OXOUXuyoqkmznVO0K4+VZ0fqUEq+0oz6gmxN5ExFe95NLM9UEPk0aR07muBu3PqulLOcLCC1rWBYC4sFYRW4zS6+8CMIK/1UFuD5nI+xWCHrqk1cQFRAJvTkInVO3GyUYD7228X7zYENphW84DFfuvB6NffDF/0a3FjXfaNQ6B2OzS4kcHvrrqJtIURgQ9qX/JtWyHdkr0RfgF32pk2o7ZBt0nZm0CW4bJ80y/mYOe4EUaGIzjxl3npZcQ8eGYCkyaktFlRgPoIFG5V+9Nms4B+5GcWZc7wXq8l+bDATTAljErni3wxCS2ac4zwadmXlfJFt8snj8t0IOug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=sTR8Hjj3qMeZkeQi25B8ABEAW7smRJgU/E3oAa0eI4k=;
 b=PR1tyLS+GUvoeLreyhefD4FzLw9yyicn+7JLXt6yWCbaUb8jdW5VyVPCCpXo6byGn96BuFJMee2S9co12MepQIBkH7fI/U0vxSxuGFSS7/hcruzBJP+/yVW7pi1yqxEkTLLeqKRkH1cyW03PFTbRWz3flAyk97gvxOLt29cOGDru9M6MvxZ1GI+F+kydDQBVYn7Mfd+7aw2GDK1xebbHMw0JK4M9PDpqmSJQIOHKEyaosWo8NsM/9XTgpB6w8MywxNGnmTiiOHRPQGn58iuXddkH2KpoX8WD/LIBQp2bSZICjbwviKiE5Mq/Y3YlRwX/W6ay0GkiwyDyQvaipINaQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: PCI pass-through vs PoD
Message-ID: <b6d598cd-c244-2b7f-c731-fe839df3382e@suse.com>
Date: Mon, 13 Sep 2021 11:02:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0056.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e7cf882-e3b4-4f43-7724-08d9769534d8
X-MS-TrafficTypeDiagnostic: VI1PR04MB5471:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5471E9E2A43B7C7C4DC50DA7B3D99@VI1PR04MB5471.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QNdgprphU2AN7dCNNXLFBjMMUZfG1CIOXjs+9wcch9K69XYi/+WDBXaXcxYKSbnY9gUPewTkfmybI0A8gotnZEhudeAXH1MsD6GS60krV/Yqt75XXmzmsAPN7J/2zW3ME9ppeo5XYQxKIb4R2ZDdj3XP30IVHcyFglt5lfatM4wie0PuONDtyYAjrqeQOL98sMFot+mVo5yG/PgMafNy0YliCFaGSgj1D7j6/Bxa59d2L0MdS2MvgmLDz57Tvx9I75gcIW8/eHtGjEJfiF7Nrw1bnUbqad5x88XtwM3Yjv1pCApGMVCrA5f3MGi9txKtSlS2Wim4uJt8cY7G6X5AgtwaRorCs9eEr604Jt4yzZmu1uRZdzebJDzlPPPruPNBWKklJ2eREVEwibrTa80EYpjEhb5peSeIDo8Z/0pCtY8N1FSQxGNJFtVU+y55Xs5ifM6TrXraM3tRZAKx73wFhgpBeI9H+2BzrI1iN1nWMlwmhUNS3dn8nA4nsTCcLGlwnb8V8w+ImsIrUvrfkNc5VX9OJUzPLUYALMTgC7mCSyZZVbVCaQ43DcxcjzzX6NE0QK38LIp8Mno35yXh44qan2T3/iNhdCk/cy5G4nucs+gDj+lZ8nEe3fzlVyb2EG5KHgTuntQX8o4SE8YdAltGhsD6BjfD2r2vQRzViJJ0FRuntgaWBP54KQKvSubhpRJlfl/OuN8+37nAOuVFemabqYGX1vdVCbGU9m1zaa1ik80=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(376002)(39860400002)(366004)(396003)(66946007)(8936002)(186003)(66476007)(66556008)(36756003)(26005)(6486002)(83380400001)(54906003)(4744005)(4326008)(5660300002)(478600001)(2616005)(38100700002)(3480700007)(16576012)(2906002)(31696002)(31686004)(956004)(6916009)(8676002)(86362001)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3NDb1ora2pQYWNpUjNVU0ZYMDFaZ0RhTFZBNEdxbnUxUG9QeVBaL25MTCtO?=
 =?utf-8?B?K3YxV0wvczl0UkEvYjVRak5VV3J1OHFoS01oWWdxSko4WENHYzROTVUzMmpN?=
 =?utf-8?B?MUdZa2g5bklqMm02VWxKdUFTRFBDWkNPMFZNV2M3NlRKOUdnaExHWVlLVmth?=
 =?utf-8?B?cEFpUFdNSHMycy9McDJmWUxSWWhJU3lSWkxkQXpaTVVzNkJHbTZmWG5tekdj?=
 =?utf-8?B?L2I0TERxV3NBb2J3dkJHc3gxVmRnK3pZSTNzalFvK2Z2bUpPOFBXN29UcTlh?=
 =?utf-8?B?K2RSNnB2a2FhNDNMSW5Zc05kbEZCU2tIZTdHNjhMVTF4K0RSeHIxRWtGQS8r?=
 =?utf-8?B?U2R2QXRVY05BclBrVG1uMUpkZXgzazJwRHR3NmxrVW0vNERTbnZKMFp4Skh1?=
 =?utf-8?B?d0wyUm44QXJmd3MyWHpRdFB6M1JESFVZZ1ljcVk4eDF3ajZ5Q3orTHErVkVz?=
 =?utf-8?B?UVhmckZkRzE2Y1hJSCt4NG8xdmprbkpZUklONENBcjRwWVlBdGlJaTZ1Vzl5?=
 =?utf-8?B?VkxiVDMwUjc1clZ0MXNjdVIzT01PMnFycWczVTBmTXNNT2c2aWxxdWxiTjFF?=
 =?utf-8?B?UnRYSjBLSU1rV3ZKNmhML0hzdk9oR2dzVkovaVIrSlUxRlFBeGlvdjlUSUho?=
 =?utf-8?B?YUJCb2JyVmlMZmQzNFVTZGZ5VTFRUlNuRHJzSGFHcE1VeDBSaDFSK1BqMGFJ?=
 =?utf-8?B?aStiY2M1eEEzYlZZKzA4dUN3SDlkNmlkME8wR1V5QjJrdlVpUUxud1JYRmdz?=
 =?utf-8?B?RjhDNU1aMjdZLzVDMFZWNnNueUVhWlZZMXNhdTZDRm1VZkZUZWtvSFFqQVE2?=
 =?utf-8?B?eW5OeXZLT2thRmpIK3UzUENUQ0N3NXo5U3VlU3p1eUxaay9CeCt2eklSQTNo?=
 =?utf-8?B?K3lTek9zN20vRWhibUhsdlVtdUVHdFEzTjJrOXF3TmxpSGkremFqUHdsMHlX?=
 =?utf-8?B?dE1aS1J1bW1iUDVOMGU0RmpNdzZKOEFrb1ZVVk84NGdxMzRidkw3eE5iREgr?=
 =?utf-8?B?cjVWQ21vRHBWTER3YVlQamRwVnhIOGxFRTcyYjFxd1pEc2hKYTVGZFRjLytz?=
 =?utf-8?B?WmZYTTEvMHJLZFdQcHhON2NsYjVUTFpCK0ZuWGpYUDlkUFFmUFIrVlhzcThT?=
 =?utf-8?B?ZGc3dURTWEFrVU0zUGt1dXY2ZjhuaTJWbEpPcmNxTXBwTWFoeWQ0cXludEk1?=
 =?utf-8?B?OFhLNi9QdTd1cmxVa0NncW1FVVdkSU5POWI0c25mcnFNaEtxY3lmYkYvVzY5?=
 =?utf-8?B?RkZ2NXJFOHAwTzZGRVYxbk80TjdMMkFpK3o1R2dXd3VvcTVqYXc2LzhyRTU3?=
 =?utf-8?B?ZTRQamJOOWZaN0UyOWNJQ05yOGp3bHAzeVpYVDVGczdLWXQxR2tBOHlTQUln?=
 =?utf-8?B?U3lrWHhMUmNvOGNzMitGTGU5UkhaYnE4TWd5aHlRaisvcFErRHROaWRRR1c0?=
 =?utf-8?B?RjNnN2JMK0JCMmVPVFUwejF4TWthdFlicHdvVHZUV2w5ZGhSb0lBTlYvdkUx?=
 =?utf-8?B?UXJSVnZzcjRZekV1YXFEZjljUUhLck5rYjk0LzYrU3Q3NnhjTWk1Q3hWb3du?=
 =?utf-8?B?MmUwUWlRMUpIQUowdHcrQStKMENUbmdrdThOTW1RaTljOHhBazNVS09TVy9q?=
 =?utf-8?B?aUd2UU5kcVVrMU1qVW11cjBJL1ZtR3JoeU1EeXJ3dEhZSnc0eVJsZ2NodW16?=
 =?utf-8?B?aGh0cjFWNnZSbFVZQUlrWk5NOTVGci9xSjRUSUlSU2tIUmFtaTF5V2c3TU8y?=
 =?utf-8?Q?DA5XfiVEpmJhejSmrfSyaqkHd5hF2j/tOuSrbxn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e7cf882-e3b4-4f43-7724-08d9769534d8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 09:02:25.9161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ddaUJnlfiaOIBWPSr1+MoHDGCufgrUZiswRC2vHCeM3bQDAA2Da2qNuU27qHmp3MGzT1XJzlPak93/0skZIybw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5471

Hello,

libxl__domain_config_setdefault() checks whether PoD is going to be
enabled and fails domain creation if at the same time devices would get
assigned. Nevertheless setting up of IOMMU page tables is allowed.
However, when later assigning a device to a domain which has IOMMU page
tables, libxl__device_pci_add() does not appear to be concerned of PoD:
- xc_test_assign_device() / XEN_DOMCTL_test_assign_device only check the
  device for being available to assign,
- libxl__device_pci_setdefault() is only concerned about the RDM policy,
- other functions called look to not be related to such checking at all.

IMO assignment should fail if pod.count != pod.entry_count, and all PoD
entries should be resolved otherwise (whether explicitly by the
hypervisor or through some suitable existing hypercalls - didn't check
yet whether there are any reasonable candidates - by the tool stack is
secondary).

Jan


