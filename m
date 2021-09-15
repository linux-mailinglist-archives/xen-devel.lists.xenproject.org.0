Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B3D40C272
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 11:11:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187351.336173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQQvp-0006gk-3M; Wed, 15 Sep 2021 09:10:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187351.336173; Wed, 15 Sep 2021 09:10:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQQvp-0006e8-04; Wed, 15 Sep 2021 09:10:17 +0000
Received: by outflank-mailman (input) for mailman id 187351;
 Wed, 15 Sep 2021 09:10:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQQvm-0006e2-Qj
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 09:10:14 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bbaf3d04-1604-11ec-b4ec-12813bfff9fa;
 Wed, 15 Sep 2021 09:10:13 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-P2XbVVMzMGuKONAOHg-auQ-1; Wed, 15 Sep 2021 11:10:11 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6862.eurprd04.prod.outlook.com (2603:10a6:803:130::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 09:10:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 09:10:09 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM9P195CA0017.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 09:10:08 +0000
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
X-Inumbo-ID: bbaf3d04-1604-11ec-b4ec-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631697012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WC674Lr8KsLW7ShRRnmjydlZkAKLLT/FjGzCzUM9sJ4=;
	b=IAoIy8U5uAvc8dpaefCwZ/dDmVXduCsOHh68xNSkDrrOgREiP1wOzSX2+se07uIlseXPTJ
	vgEPNFJBl3NRX/ooWhHW05r8+9z/EqNzRWA5KCseKhJvYZV0xt+MDJYfXZmp25YmDDNJua
	Y7gIaDrEAH5Q8z7D3YGutueM1XNDs2Y=
X-MC-Unique: P2XbVVMzMGuKONAOHg-auQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVWUrUp1TYjtPQFzuVt2qNl55YqTgYU+Eybr4rjIZEiXV55l+VgT2xaaTJ7Hr2hPfkbXI+EAGZO9jbou4NeBLrrcEwifL1GZG3Jgjqlb2rV02Ae+AKwCUsHCrJHgpRYL294NwLU+KcsukucNjmIplljrFf/EbYgwGP1s2miwmA7/g2UqqKGaAHE2kZQGk+cF9pi6bP9/W+FLu4NmccjKBuzPD5dAH/mXRxuJi0w/1T/XjRQiRW36UQfFNxDe60GZ+h5AwpVQI2h1I8xgplfO5JHQ2X7q77FCvvx7UbbufP3+iizj77GRhz4MQk0DbH+1Hn/7nNcMF1HjdwrR/AeWdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=WC674Lr8KsLW7ShRRnmjydlZkAKLLT/FjGzCzUM9sJ4=;
 b=jiT6GBDq70s2fzwUMRNFbO1fRaHGn6f8Dpap/D4pHyh2PdECYGYfvS1c3mH03VJOl3afK16CsoN4PMykfiL0WVWi6k9YD0GUPE34yzr1psu+UJ9WlCW2BFKPNQcTI7GZDAav6pOiWaGrjApzFSE1hG63KcVYH/AhnITR/MLLxYOCAM25/8R6me+4RZ1AaLPkg5seZvws/rgzWHrpfIzIYNihgICjydZ/mbfleAJq4jTvsZw9RYH+m7ndGEoZTmgxMreN29ogrNV5MnXUWoCNZaHKrfcbegUTzF42AZeN4vC4aD3ThSeA6fla8zd1PwK2mEajPb65/TNeXhkVi/1mzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: IOMMU/PCI: respect device specifics
Message-ID: <b232a5d5-5054-e305-a260-a0562570f033@suse.com>
Date: Wed, 15 Sep 2021 11:10:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P195CA0017.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05e927e6-cd63-433e-8428-08d978289dc2
X-MS-TrafficTypeDiagnostic: VI1PR04MB6862:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6862CD7EB13554287BAD3EBEB3DB9@VI1PR04MB6862.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k3JgEyqxwEWwqgGB+EUEkFE3dB+O3d2OLTe5BeDJiVORVEhHesvk2SSm6iczNlQmbiAYoGXt445yQcBqN56XW3cqsTa13ocCkO0eMTAHJvcepqn9bdl8Fma/UUVHBCZfl9Fm5ZYDKXepDdrFxGksniNdUMgf9g1VnFLwQUjcSQuflDo8BpZ4ajRWoKb74GHlxtsRdhnY8lsDbw9wJa0A6RNWtlfMll1TmxHprjezD6GDJ2VtoWucZRWuXV4eYQWXfl9JEBLqAy24As0YH4Oht6ECI8/3wwJ/Vpw2Nik53vrBL21c9DZ7ThhwXPTuc+GOr+z5L7GXHsZM6WlzUAQ3DDZug4lRHrc3AvDIkmcP8m3RQIN7AfT0w552vxeuTHki682DQ1q+UpY2jti1aGjCcnGaPglbJy1s1VmFwjBk4PLNxPXSInsBS2MjpXJHIL4Ay3lFXuDazOpv6T2WqNt24qEtxK3gYHPWCvUR/9bDb35pR0cAl+MF0QebglmnYcH4106bpbJjRYjhqheHGvxvXR6d/tyNyZypkaMB79naYjAaTgBwLPJaF3QiBJvqfIiXQhJ8QTuUqiiyzk/QJkIrHLXWhi+gL9EtH8dvSpip2ts1rIH6yc5PdaDXJNn1WZ6ij0HgloJqzp2XFYKH2JdfKojGXP2YOguCyBN1KBGwQn6gp/gQX3UxX+n7DDxcoMypwVsLLVbxgxZJL/qGSCMmIG4G+9lwU4if9N99iafgnaJi3RnZ9aaxn1SWXGUFBO2m
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(396003)(136003)(376002)(346002)(36756003)(956004)(2616005)(86362001)(83380400001)(8936002)(31696002)(2906002)(31686004)(4744005)(66946007)(66476007)(4326008)(66556008)(26005)(5660300002)(186003)(8676002)(478600001)(6486002)(38100700002)(54906003)(16576012)(316002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tmo3cHIzTXJjT05TMll6TmZuSm9UQkErQ3kvcENvemswVDlsU3AwSkFzcGpX?=
 =?utf-8?B?YW1sSHF6WS9JVVRkY3VSVlFSOURBREx2c1cybkl0c0pOSzFGZGlGVUpUYnNz?=
 =?utf-8?B?Nms2T0x1VlE5MUJrZWEvUXZ4b0xvelJHNHlqL2ZpeGk3bU8vME0zdEpDeXh2?=
 =?utf-8?B?QXBYdVVnSFBBV1NSNUpINFZiWDV3dCs4TklScGc5WHR5YjFnZlUvR2tNRmZQ?=
 =?utf-8?B?ZXd1ak1JNG1YMTJYeG5XelpxVXppTi9VbVNjWmc4bDNNRHlpeTdscUlZR05E?=
 =?utf-8?B?RlVybEtaRGxpTVo2T096cFJqbGpZQnJ3S0VjZWVneUluUFBiNVNYSGdJWUIr?=
 =?utf-8?B?NGF4ZXRmeXVTTm5WeG9FR1Nra2R6bmt0RzRkZCtnUHVuUjREN0lyZktWUE5k?=
 =?utf-8?B?cjR0Vnk0Tk1QNkczUjJReFJuSDl2aFRjRXlEUklzbjNsYm94RENDWlVzc2V0?=
 =?utf-8?B?UmdRNjRXcmhCb09JSlhqVnJ0S0ZSUlJZNkdFdzRSR1R0Y0dQQUNCSWtFRHVX?=
 =?utf-8?B?VVVjNHhZUVI4RVhWb0tibmRGWnhMekhxY1JXbVQ0N0Era0dhSm0ycTFEc01q?=
 =?utf-8?B?aTQ3djZZMlE5OEtreEM2L3pra0pWS1N4Tlc0SXduUDZHMXZpclhROStwL0Jj?=
 =?utf-8?B?RlpGMUJHNHZya28rem0xd3pLYXdva2c1ekw2b081Vitqd1prRGtkejhaeU8x?=
 =?utf-8?B?b0M0VkN5SXVHQ1YzUk1wMFJiUGZjTlJha212c0RLUHJKOHFpdzJDVkZYcXRK?=
 =?utf-8?B?L1BrWENIc0VzQmt6WmZpMVJtd01HbE15ajlnTksyUTA2Zm13QWxreVlOKzlZ?=
 =?utf-8?B?K2tEc3E4K2JBUGlpcG9aT2kwWHlVQkt5WExxNDR5WXlyRHVHUmFhaXMrRjRx?=
 =?utf-8?B?Tk5ocXVzR0ZsTXBZTVE2SzVJOFhRMWp6emUxTDBsMU5YaXpveHE5eGpOd1Mx?=
 =?utf-8?B?MDE2ZEgrOEIrUEhkL0syQzJWbHBtNkNuaDl6RE1LMkFleWdqeGdsbzBVY0Q5?=
 =?utf-8?B?NU00VGQ0WUZPYkF3Z3I0Zi9qQkYvbjNnOG1PYm83QkR0TStGSHQxV1VsNGl5?=
 =?utf-8?B?YXhqeE8zM1VVQ2N2ZlhzVEp4WS9oZVJmODZIbzJjenNvUGZSMXYvOWdGMjlU?=
 =?utf-8?B?bFdUODhIcWhmczNOYXNDRUZKYk9EZmc0ME1CcGhJRHVjY2pyRitTQkNvRklJ?=
 =?utf-8?B?WU05WVhrOEN0dW1CWHhMM09oYXg2dVVaVXdwQlo3TmlBbHdXVWprdzNEcG9Y?=
 =?utf-8?B?cXdUb3lnbEFLTFlCQldkWFM2MlFseUpRUUJuOUtuOEFSc0YwUzMxTUJxZ3JG?=
 =?utf-8?B?Yld0NFAvamJQN1ZhSU9BZFhCRjk1TXZ1MDNzdUVOMG1EdDVpcjU2T3NrUHJl?=
 =?utf-8?B?Skd3aGEweEdWenEvckJxKzB0cnA0NmtTa1dZNFFpQUFhZG82NVFZY2x6M3R6?=
 =?utf-8?B?MUIrRm9hQkNadjg0THRCaGRLWVBPYWRlMVJPbHp2bzFENEFzZDJaa1pSWnRP?=
 =?utf-8?B?YWtVNUVYaVh6aDZPWmJaU0lEQkJpSWV1WUhwTXd3WjVJZENySjFUcDJWZ0hr?=
 =?utf-8?B?WEtBNy9FOWVtRnF4bFRBaWNXanUzRWMxeGFUbEJPVGJ2dXI0bTJYR0JjeHlB?=
 =?utf-8?B?NjlmSzNxWVdoNGkweEdocmUyTmFDK1NSYmFZYUNyNXNPVmFJeEI5bUhkaFJV?=
 =?utf-8?B?UDVRd1gyOW1TSW1Wa1V6anVNOGRZUlhFS2lJa3ZKZWlJVHJCc2lHZnJocTBa?=
 =?utf-8?Q?zYtCh5NjgzREsTARPO+iPF/G0u9HuCjJQp4ebBS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05e927e6-cd63-433e-8428-08d978289dc2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 09:10:09.1440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gHQkEwbBzQMS0JtoX025kX4Bbz/lLFt7xgsWcMY4ZS7CB34hg68aGLP9+zsT3qSCH1IypH6bPBiT3mR0zAuO2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6862

While making the first change here it occurred to me that the recent
vPCI-related discussion about hidden devices has some relevance also
elsewhere. In the course I then came to also notice a phantom device
related quirk.

1: VT-d: defer "no DRHD" check when (un)mapping devices
2: VT-d: consider hidden devices when unmapping
3: VT-d: skip IOMMU bitmap cleanup for phantom devices
4: AMD/IOMMU: consider hidden devices when flushing device I/O TLBs

Jan


