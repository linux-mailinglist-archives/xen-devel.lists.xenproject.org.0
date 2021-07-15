Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CD23CA091
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 16:21:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156656.289088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m42Eq-00039n-P0; Thu, 15 Jul 2021 14:21:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156656.289088; Thu, 15 Jul 2021 14:21:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m42Eq-00036t-Ln; Thu, 15 Jul 2021 14:21:20 +0000
Received: by outflank-mailman (input) for mailman id 156656;
 Thu, 15 Jul 2021 14:21:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U73d=MH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m42Ep-00036n-MB
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 14:21:19 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b7ee0da-53a3-49d5-ab5a-6fca41f950f8;
 Thu, 15 Jul 2021 14:21:18 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-isSssNAzM065B5tzN66dvw-1; Thu, 15 Jul 2021 16:21:16 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5470.eurprd04.prod.outlook.com (2603:10a6:803:d6::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.26; Thu, 15 Jul
 2021 14:21:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.021; Thu, 15 Jul 2021
 14:21:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0228.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 14:21:14 +0000
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
X-Inumbo-ID: 8b7ee0da-53a3-49d5-ab5a-6fca41f950f8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626358877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sonPdwLkJ6VgCPmFCqfPC6h6XGH70ftwkFRw/0yrh0Y=;
	b=Jm0OhQ2X5Mmm7TGy+DS3D+2YXx18M+TXlepj2OFaxx2QaUxrzrdOt31mvsN0/cEJ3a9qc1
	ezHw1XtRlD6LCHmotaBae3DlKj6Bcz51zKzWSnMpQc1RtrBxo6GsXdYIidoRrJl0HxyEo2
	8LbrSs+MdSu4sRYUXge+YlnC9moy1o8=
X-MC-Unique: isSssNAzM065B5tzN66dvw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhavpiw7LuQj9rqRh6xE9c/29ci0OP/vri9nRADe23LO74ZPy7eT7gxok4fnk7h7fvQFlpXQHS4++GSJBkPrHnJGTJl2yzCHL3LXbIYkz8FZ6VRAhdN09d8PFu1bmTCgFgOW7Ydv3eiwaGDhrl6X+vAo2Fp88Z0+cevhhg0qiAvzL0BPske1auprkb9Q3vfTV1Mz68Lc9r9EQeH9GrqNG7VNzKvfGOUdeqqMpzlo5lJsVGdzJrFYMPRje76iZu7WphLFtXZw6O3YAC3a2FzYwTAh4JP4Ps5c2tXRO1+d7R2db+0HNFl5nYW/FD8M0zkvW/uqVVBfMHHJoCPhi1+viQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sonPdwLkJ6VgCPmFCqfPC6h6XGH70ftwkFRw/0yrh0Y=;
 b=jzquSSTX7yPioQ3AzVFlVvJb3Ky0L46bGf9JJ+sAP67ykvE0nmUoex3bV9qM7njGQWf/Z/qL/o8/5E4MDQ7bXUEu4zF8MDfh25yvs9CulnhzCprQh7gkfZTNNBr18QYpyy6YsdlkWeFU6uAAr4X3F5OZizHydtSN/9QhWAs3nxTKkcOvlDoCKz0w8yaWXA/zgyIixP7RgPrzgc07UBZGT4F+70yeVhvC9EAo/zJv5+Pydk/9+xaur6tHSrEyqRgHy/kjshIClIzskgIPnJM20FlfieE3ooNVFG2cBiTUd+OD80OxdCRxJ+Ab8ZK4DlJMJfb0LqpILNgYkFKwcAW8Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: preparations for 4.15.1 and 4.13.4
To: Olaf Hering <olaf@aepfle.de>, Ian Jackson <ian.jackson@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
References: <48cc22b9-6d0a-2cfc-ce34-6aabeb84b160@suse.com>
 <20210715161157.7e85ed9e.olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e0c41583-5fc2-b938-fa52-60d3ad72f59d@suse.com>
Date: Thu, 15 Jul 2021 16:21:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210715161157.7e85ed9e.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0228.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e09c4590-b5cc-41b8-1c07-08d9479bce0c
X-MS-TrafficTypeDiagnostic: VI1PR04MB5470:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB547039AE20DFFFD0346C0761B3129@VI1PR04MB5470.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T42qMRwRsh4y5+9AxyjzDpMFo66oLJDZ+AmFBHJfsQ9NXZhho1TjsOqj6acePl/+w1KaVnjc8iz5Ertf80Z/iS5BtvGGpM+GKP9sUS6oi48Lx2Jis+mtFSvLQtlXYatWMt0iC22YAwZ+zdUt/SYXvrHNZlnQT1CpD5OSUdPodpTvfbymUBOeQopnTrDBKOSV1C7xRhcwmxxyxgg3mekRHxa+eS3E6bAaCvhBSE0CmPo4h+LVm+rfPAMbqTTINT91B471Ze8YL2qBLJx0w732+VAAfEi25o/tKaf/FYrOZtWxVSTRnjNU/fmtZT0uq0QXrVL0nsuJmA6fqN1Vz+zUWP6aDAsSxN6Dxfw8TGHkJ/RDy72vUoCM9H6dt4uZmjWRHbYnYhm97BUsN3NDmCqGbdvJJNz1H4fzDlBHLOjDI2t1ttdCv3vENr5Q3poQ+ohPqYqdwGD80NFAByTJEIgohzr4vscIl6mLXQxXcAsXYKLxYKcyZadfDwh4RNHGWcZlfkebOXvsyMYeZfnHRwA2q4SgeBiEBPYSXjN3TwpQ3JEDnIc8fbhEhSKjXBhptfZHt5E6I4kPZlvYDraNzGZr/k2vSETDVueZ00xhSOajjWB4rfxftb3lzPoxu6ZtWaJ7zIrh7yFSiMi2rsYdVsUOzchcCo8pn1KtY3MVu0p5Id/k+i5cI5ulZuNuhwZ7ZCnnpjg7O6RXucHrmFTC4mifUrYP/XOohNqx33BXGxxCk62MmIHUvo8pwcptyRKHRUaVdEMLjoqwOnPL7dwP7khEU7G0/WYI0xbA8kmFi8ZpX8cQiPi0HDi6JoiezKKgNdNh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(396003)(136003)(346002)(376002)(366004)(31686004)(6486002)(4744005)(38100700002)(26005)(36756003)(4326008)(478600001)(2616005)(5660300002)(966005)(53546011)(186003)(16576012)(8676002)(8936002)(31696002)(54906003)(956004)(66946007)(110136005)(66476007)(316002)(86362001)(2906002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?Windows-1252?Q?N0G4BIQ2WZH4QqMyXjM8flExnktXAJfK3D7lU/sFiaBgsZNr66fDlPm3?=
 =?Windows-1252?Q?eBbIYIOrPd/BxEGXrrk468LuBBd4NKEcxC5la7pUAjmWHhOSt3VPEJxn?=
 =?Windows-1252?Q?KoVQ7ADjFEOHYuUKTrpRv3w4Ps5w8o+i6h2wa81eO7RpB23b6LIfjJe2?=
 =?Windows-1252?Q?XByx6rm59K4xAr+u8sAyuVQr4WpgBPobZAikI8UdnSdEn3hKn9o56i2f?=
 =?Windows-1252?Q?hyLhdaXfQjBGdwWEbFyAzD1/6Mtnva9GHwmFidYb0Qd+AusOOgGAH6BI?=
 =?Windows-1252?Q?yLz2AwIgcE5AMsGoc+I5uoqh+93qSSVXIsmJk2FYwF7x4nYmxeuktI5u?=
 =?Windows-1252?Q?gCRDoemtlzM/FAJOLfEz0A9su8ptCAEyLikZeoFrXP1ERMS17A4JQm96?=
 =?Windows-1252?Q?Y5zTXjJmpkWvoCPP98Yxm0+ZxM8IVajy571NNjWY85aKMlM4xpelUcjd?=
 =?Windows-1252?Q?AIf2SwyuyxmNLTesBX1Fzw1yW6hq0UmQLY6db+YU051AAev9xqA/tJbt?=
 =?Windows-1252?Q?JFc1gVjzHdtBXNsRqaphWUyZoST/MLf0aZJqjdll4OBoB9ISvSt298jC?=
 =?Windows-1252?Q?3CSRlf4zNn468Tsi2sU9kcGtglr5N4gfDe94fPXtWzhhVEWMrrnsz/n5?=
 =?Windows-1252?Q?gvdwF7LeXUO0KlXnZthDHgNa/fLk+y1KPmdcOM8433RRFvQKluHO8wjO?=
 =?Windows-1252?Q?RHntQ0Ddi83tstBO72SvcC+4JHa4Swwtm5/UTvEqpIq2bQv0hXa+LCop?=
 =?Windows-1252?Q?iGRcZPZFcpQ+5aBOdH/0aNFHgoHZLg7hfCJjNdpekO6jdvn8rESmxRR7?=
 =?Windows-1252?Q?xDc5NTl3tw5qC603gsFlL7T3wgk778TFPCIcAYKmmHRghUNwM23t7mY9?=
 =?Windows-1252?Q?60E40syag3hKYhs3x5puOiLlT700nSxmFZRxEZk9rUaS9YqRgG3AVF4X?=
 =?Windows-1252?Q?QbQAvbSwavgFncEt2EPIbQ68PgHB4vqsxJweSFSMkv9LfNu6eumVUBYK?=
 =?Windows-1252?Q?SyoY18V1YWL25LQDc71EM+ruLc/zPqo/Ld31I0V938Tjs9HoPdn8u8Dh?=
 =?Windows-1252?Q?VpNTLaTW4W7jPsnMAWHUO7am7HWst4JCkbsZZSgWqAihn6DsAZkxDLix?=
 =?Windows-1252?Q?WyskLWHW60tsXDRupEKUIX5pH9re/wzZ/W5tLc8+QW9Za9HmV34ZY26q?=
 =?Windows-1252?Q?thtVTrhhAybj6Yf5RzskKlwWEhIdiLlXqmlEb/Oo2vgEYZpheLYtE8ZT?=
 =?Windows-1252?Q?jMffzZv9Q0tvBA3H/o9tU9nRzOKrwjvUk4185FOTGWgthJegDWDlmls3?=
 =?Windows-1252?Q?pty8IaMabfk078LZqNQbc/tdKuexMxFCspmPRHVra0RIOIQioMzEjLnG?=
 =?Windows-1252?Q?2BoruuKJwXXpxwWgGPxM5zmYLfpk3T54DyFNxWeGuQPo72IhenQuT/Q8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e09c4590-b5cc-41b8-1c07-08d9479bce0c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 14:21:15.4327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 22sCef3q8l1f0aQqC+gX0siMLHR44tWe7V2KIeXVThsuRnh5lsq/FQWO6aWsJ7P55vYm997t6tvqJieppv0VKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5470

On 15.07.2021 16:11, Olaf Hering wrote:
> Am Thu, 15 Jul 2021 09:58:24 +0200
> schrieb Jan Beulich <jbeulich@suse.com>:
> 
>> Please point out backports you find missing from the respective staging branches, but which you consider relevant.
> 
> Depending on how green the CI is supposed to be:
> 
> 76416c459c libfsimage: fix parentheses in macro parameters
> e54c433adf libfsimage: fix clang 10 build

Ian, that's again something for you to consider.

Thanks, Jan

> This will likely turn the Leap clang builds at https://gitlab.com/xen-project/xen/-/pipelines/337629824 green.
> 
> Olaf
> 


