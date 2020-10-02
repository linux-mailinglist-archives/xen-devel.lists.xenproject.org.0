Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA86F281960
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 19:36:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2286.6828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOOz6-0001yk-7G; Fri, 02 Oct 2020 17:36:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2286.6828; Fri, 02 Oct 2020 17:36:44 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOOz6-0001yL-44; Fri, 02 Oct 2020 17:36:44 +0000
Received: by outflank-mailman (input) for mailman id 2286;
 Fri, 02 Oct 2020 17:36:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jYI3=DJ=nxp.com=laurentiu.tudor@srs-us1.protection.inumbo.net>)
 id 1kOOz4-0001yG-UE
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 17:36:42 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::60d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 830e3b57-e76f-47c1-b478-1aa4f45fdc6c;
 Fri, 02 Oct 2020 17:36:41 +0000 (UTC)
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26)
 by VI1PR04MB4238.eurprd04.prod.outlook.com (2603:10a6:803:4e::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Fri, 2 Oct
 2020 17:36:40 +0000
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f960:c16d:16a5:6e7b]) by VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f960:c16d:16a5:6e7b%7]) with mapi id 15.20.3412.029; Fri, 2 Oct 2020
 17:36:39 +0000
Received: from [192.168.1.106] (86.123.62.1) by
 AM0PR04CA0013.eurprd04.prod.outlook.com (2603:10a6:208:122::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35 via Frontend
 Transport; Fri, 2 Oct 2020 17:36:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=jYI3=DJ=nxp.com=laurentiu.tudor@srs-us1.protection.inumbo.net>)
	id 1kOOz4-0001yG-UE
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 17:36:42 +0000
X-Inumbo-ID: 830e3b57-e76f-47c1-b478-1aa4f45fdc6c
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown [2a01:111:f400:fe0c::60d])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 830e3b57-e76f-47c1-b478-1aa4f45fdc6c;
	Fri, 02 Oct 2020 17:36:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fgUTESy/kXFaZC2Ramf0ExnaEg9WE7ufSDcMIgdRvPm6dCeWQu6/01a4AnJwjeQ/5bFAwU0hCMYHGYmnMe18vcUQQmwhJCy/p1fVKaWcQ1+3gJ+lnv7dmNwcY5AyUC/kVbAPcnCdyhSbiElKfWf4JIMm6HcwrzwY67OVx7QZGVzGWl43zzfZtvyuh2NLNkAc0PFMwZhz7sNcl9UKU4J+t7OBR46zGycZ8k8x3qJvrakj68IviYlrXlPELYzJ9CR7PJF9vp6L6IEKosFYUKpxwTl7H53UtBAu4awpFN1TQu16z9wWP5LHa6ATw/fSG7IU7lky4YP+YWk80j5iTZSX3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5KmmPazVlfHshnJbIHEva0ACD450kflohBpRredIuHc=;
 b=OUpFxSdIUlAZid6AmXxEWgEb6qdLhrTomwfN4lxK7cgUZ3BSoV0kO3zPApq+aVt8WEQmTTJU9fCB9UdQRXmKusnbfI+0Vot043LdFvPN78CfPAw8weWXGqr6wSDovTXgyAe8ixVJjsm8fBGLY/AetGpSEYzBhw5LCDP/hH2sN9eBDn7lCblOFDM07f4qxKBcfQY7al0XBjb8+E/ULLtVrCugn7nEX9zY93dpr/vK0AwhUv7mQnBAE7eOOyusRgoR1OYejN8LkrDsYFsEBlbfyryF59wW2L9TFuhkIk4mbMDzPQyQf/p/UKH/ccGuVoERc3n/l1BhJ1p0IDCYBGY5Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5KmmPazVlfHshnJbIHEva0ACD450kflohBpRredIuHc=;
 b=FtZLb3jqt7XDEM3BVOcXFI5Efd0Y6OlJHq2FYI+qVm5HcwAP34pn9QDEme2/1zh4Xsa8HKKjgSLjbUPBlAbiFtXp9NgljXwabPKL1izgPzdFmKDVuP3fSjY1rVa+yMgDF5b4TBAhBA42ubJWsX2QUKCgsVP6UXX3ecxlVnT+/Iw=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26)
 by VI1PR04MB4238.eurprd04.prod.outlook.com (2603:10a6:803:4e::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Fri, 2 Oct
 2020 17:36:40 +0000
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f960:c16d:16a5:6e7b]) by VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f960:c16d:16a5:6e7b%7]) with mapi id 15.20.3412.029; Fri, 2 Oct 2020
 17:36:39 +0000
Subject: Re: [PATCH v3] arm,smmu: match start level of page table walk with
 P2M
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: julien@xen.org, xen-devel@lists.xenproject.org,
 Volodymyr_Babchuk@epam.com, will@kernel.org, diana.craciun@nxp.com,
 anda-alexandra.dorneanu@nxp.com
References: <20201002103344.13015-1-laurentiu.tudor@nxp.com>
 <alpine.DEB.2.21.2010021025170.10908@sstabellini-ThinkPad-T480s>
From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Message-ID: <c26d6cdb-93b7-c184-793f-8631b165716e@nxp.com>
Date: Fri, 2 Oct 2020 20:36:35 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <alpine.DEB.2.21.2010021025170.10908@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0013.eurprd04.prod.outlook.com
 (2603:10a6:208:122::26) To VI1PR0402MB3405.eurprd04.prod.outlook.com
 (2603:10a6:803:3::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.106] (86.123.62.1) by AM0PR04CA0013.eurprd04.prod.outlook.com (2603:10a6:208:122::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35 via Frontend Transport; Fri, 2 Oct 2020 17:36:37 +0000
X-Originating-IP: [86.123.62.1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 29c97d47-0581-45bc-92f7-08d866f9b754
X-MS-TrafficTypeDiagnostic: VI1PR04MB4238:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB42380D22523C0FEABAE5BE1DEC310@VI1PR04MB4238.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	czG1IPHmPJcpA9E4eq8bbzajn7CmLziXAVGTWf96CtnuTn26MKZf97loV+UqsZTvPHeZOYy3EJGa8Y9ozzBdckoSoO8oKtCn4uIpxBcVBPpb97UZHw9efGdOxGcrD4DPeCuH8GDiWP95XWKk/+X37iBWiEjdcZXDWXvClXStQ9bZIWzJHW/dJhrs1uNu9QvxIfWqECHDQrZ5UTeiauwq8IHsPcRlDRpSFVu0Olahtx4reUeCvXuIbTz78pqaf5yQdE1Us1sHfqbwg8P9lw5vT+NuuRCThHlwF7leyqHZfzNuv/OSY7Urjw45SJDrKVXTIvK5E7lJzX6unhwTt/9C6PuHCtD+Zxz5zVm4VU2QDP3Z2EXrtwRU13NXCsr8UUqr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0402MB3405.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39850400004)(396003)(366004)(376002)(16526019)(186003)(36756003)(2906002)(2616005)(8676002)(6486002)(6916009)(4326008)(956004)(26005)(8936002)(86362001)(4744005)(31696002)(16576012)(53546011)(44832011)(52116002)(5660300002)(478600001)(66556008)(66946007)(66476007)(83380400001)(31686004)(316002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	BmMpa6CouGmPIG9cLN0eoJKIEAYzF9yjsOfHi6eoST/dacnIlkrtIoli7qC+nx8td2w1SA5KxDYV8xjyg5PY/fCp66BL2wftEGMsOuSDfc3Q9QFHgFtsHKC8+YrGX0b5pI1P+pszAi5F4lpViLdWzDIFh6WY3KuavDgzyRT7vhi8MrNAavnDiupcl40XBZJk4UTgbhty3PR3OeGOj2wIXxBsWvzJDIOgcHAizerIzhDuwW9Q012LPAHtqnobxgrwITAUiqgn0nhejvtM/9AoOZm4zxtFCZgCr9Qi2pWkV2Uix3EQ6Fe09CSqb+fBlItwpgekwqZPAkiWTGqyOeUZpJxR16m5kllJR2aTO8R3AtelNZRS8AljUMKmZTLhQMG8+Btc5h9vmaXux/FUj+xC92rH/fUAGVIRDM+D2JFcvAf4lHBNPL7ARxERkOtzUsFmlwf3FTz58NpXoX9G4LG/lDQJaRBnCMX59uJ+9xrERmXZlgk+D5kTehLJGBNpNITTQYr5ehczqs1IQGMu6DXIustpip0mlH4E2zcpWZb6xO0KUoVl1jHSCc2noEs7mSPFRZDZ9diMEUaTH6E2dZmn4PdMYi1E2e94aBEcnP+X9GUbGrz3nOtiQpnD3LELNMStdFIBiIe4Via61sopi2n2kw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29c97d47-0581-45bc-92f7-08d866f9b754
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3405.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 17:36:39.7149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1clifj5pD/OU/WlE/T4OThXtm0wvSynQOS3akAizI81dGKUNpF96yc8LTVzAZymROFYb1CcXui+oxLB/bHW1zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4238


On 10/2/2020 8:25 PM, Stefano Stabellini wrote:
> On Fri, 2 Oct 2020, laurentiu.tudor@nxp.com wrote:
>> From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
>>
>> Don't hardcode the lookup start level of the page table walk to 1
>> and instead match the one used in P2M. This should fix scenarios
>> involving SMMU where the start level is different than 1.
>> In order for the SMMU driver to also compile on arm32 move the
>> P2M_ROOT_LEVEL in the p2m header file (while at it, for
>> consistency also P2M_ROOT_ORDER) and use the macro in the smmu
>> driver.
>>
>> Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 

Thanks, Stefano!

---
Best Regards, Laurentiu

