Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A236469D3
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 08:45:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456836.714668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3BZz-0002bQ-P3; Thu, 08 Dec 2022 07:44:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456836.714668; Thu, 08 Dec 2022 07:44:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3BZz-0002ZP-M9; Thu, 08 Dec 2022 07:44:27 +0000
Received: by outflank-mailman (input) for mailman id 456836;
 Thu, 08 Dec 2022 07:44:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u3z7=4G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p3BZy-0002ZJ-PA
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 07:44:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20683317-76cc-11ed-8fd2-01056ac49cbb;
 Thu, 08 Dec 2022 08:44:22 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9142.eurprd04.prod.outlook.com (2603:10a6:20b:449::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Thu, 8 Dec
 2022 07:44:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 07:44:21 +0000
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
X-Inumbo-ID: 20683317-76cc-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ghJTvrX/psclKhKoRJyCDEP9RnvXdBZBsr8wYSbthuU4iQ2dSF0eywl5bHoYq37rwCzO+UTHYhRMJv3S3OQz6pOcw4T8090D1Kb+6+BB1DYATSXN/ATYX446552Q16bBHY9HhIyMRGTy9xJkqeH1b6rZz4k/PAj9BhzUEsT9vnTK94iEkQZ5SQVANThKdzK4kYsAdA9JiGAt8GLcZ4+fVAYKME+8sfBG2rHXyShtcfaEtyCdvFejlzwP2DzG1hICy6t0lfqwKjy6Nwsnb0ksi8vInrqwA35oouxLU62rQ5+gcJccOb8l6xzl9O9ZfkwFor8+lf/KrxBYc0wCyEEf+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IqcM/64s07s6IVs+pXNhTE5ECGYiiWTdi+CVVfWqF+Q=;
 b=oS6gdE+vasyoq1XntF8TYC8nvtdRz6rCK1MP7K81gazpH7/C9vDoTs1gvEs23dYqHuUuBhlXkp2RR885xinA7Vc19zs17LsNSH1zfBJ3rptFi9QdE84Gqpa1t7lkSjdTH+Lf7WGVPqn2/I8UB8bPizjXO4u6vz4OSWkb6bZL7HDr6usRI29jOkaK1PBFFjpPeXtZLqN+XDndTFg0Lt8T2DTYcHkBv55oQVfu4SIcZXIzHCjfIKzkFucifdF11KEEKsuls51ieaNNydnnVmMhz4+WYU0UgVccD2VEZ8lcreT3ABJIzw/ytXlFLbqVJE8Kxtuk4KQR0Cl7G3DeoLAfrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqcM/64s07s6IVs+pXNhTE5ECGYiiWTdi+CVVfWqF+Q=;
 b=UEQsjyXHTQmSrOm6DpNMBCIZgBE6jbM85IR4dZ3MVkk2j2+j6a9t9R4Olhd+Ze031p4xcc7u8EtgZwvZ2pAsqtQt4bP9ILd7P19+/GyJzphh12xShOlf/OXtCDebFA3oOxOKpSRY/I7FsofFPhseP24TINVqJZvCDaUIQ7mP34DSN2TsrSzUrxKtqcXk1f+CN8Bdm86WYy6/JlQhngUtCGowDDXcTRrXRPQiHlaiDA7wrhyv0n8guxlHPR1U9/kVKgj5FoTmzhpHG6oyRhnbW48bWGtx5apTyYqJa4wIleGA1JjJMnVl+ZhA3c12uoY7DwutprzNWVcX8U2JhfPAuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <01d8ada7-8613-1747-2fc5-6447ab07ca63@suse.com>
Date: Thu, 8 Dec 2022 08:44:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH for-4.17] SUPPORT.md: Define support lifetime
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221207195907.23606-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221207195907.23606-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9142:EE_
X-MS-Office365-Filtering-Correlation-Id: 96b2640a-cf7c-47ef-bd63-08dad8f0051c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IJvR4uFvmZ6T0pJ+1kHDVPwxpITBLyj/6PPdxfiAkCUqgvhGqo28CCOZg+uLdlNDjBvZvgsHPDtVYZNcO8H3w7k5JN0X1VTb6Scz0TWdkLT28kdlZgY8iPlP+W2m4yxguGUcIQEsNcYgbZqYfF+cqttuWq5YBKHOoGGnDZyF6ljj92UvCvvdvZZFIVAbFZnFq9wGXSuQLh3uecFNxn9zJ/BD1iLo3w0UBb7H2zl+OVPQKy6nn6vL4+WLsjDx27LliPRvbd1q5hc7F9OwUL0mZzS/fBUNG0FxHmeo0IrTSvmGki5A603rsUIrOAjRQsQr7ZI3ChJ3Ee6e5YBAvGt5Qij6Urgeo8+Zxq5UI7yxdePwMEFUl1NfB/KTCGORsXEOOyMq6r7gqzyrw/5cWdThbbhoKFkla8pV5OYTtCU2Iqffqiq6j6IU+CC36nK1wSo9WJnilKgd5Z6fOm4bZ9Dw0Pvv2OPRxGU+LHFgelrxwRrEiA6JyoGJk+FAJZg2WbjA8vGP94+Dih5mV/4UuQqZ3mI4zNHzKFKFjVCEjjLC5/WT8w2BtjW2L4NRZsyPR5NQFVhnLaD8I2Bg7SwYNpnIiRt6oVyTJNJTPIhCF6sy2Ifz8NX2nlsX1CirS7PlOf3Z4xvuymwRksR7CAhu7j4zf0ko+1Hkkx9SwkRTLL2hwi3PVam8unGEv9tbo7c7Mm+HJLQr5FFzSDjN2f0sxQQduATfPbcoaRUKfjc1e9ajKVQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(376002)(136003)(39860400002)(396003)(451199015)(31686004)(6506007)(86362001)(478600001)(31696002)(6486002)(53546011)(36756003)(558084003)(2616005)(186003)(26005)(5660300002)(66946007)(4326008)(41300700001)(8676002)(38100700002)(6512007)(66556008)(8936002)(316002)(6916009)(66476007)(2906002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0Iwckk3YXYwcmRTVTdqS2dFcjRKQXFKTEpsOVk3TlNEWm5qV0lWVUFsZEda?=
 =?utf-8?B?QUdsVUtQL0hKUXZrLytabmxMQlcvV3BLemxSNW05ZUFQOVZ0QitCNEdSOEtQ?=
 =?utf-8?B?ajdyRGtuRDE5NWFGejBOK25Eam5OSkxoeFlYL2gwR3A4RDVnSThqejdUbXZs?=
 =?utf-8?B?QmxpYWk0Y0I0Zm1SajN1VC84Ymxab2JrSmx3UTNLNEZsSlM5SEg4VGNRNHdQ?=
 =?utf-8?B?ejVGQmp5My9maGNTTjB3R2hBc1ROUDlBcHlORGhueXUxSWFUUThiaHNaT3po?=
 =?utf-8?B?a2dOaXNiNGYvU0F6QzhBbXpqOVBqWWdWb2lobWZsQXlaVndLREMzamtmWnNE?=
 =?utf-8?B?azNqZ21CZ2hJNUFiTTUxaVcwNzJJNlJhcHFySTRQK2w4UE9Ob1FFeWNSRzNn?=
 =?utf-8?B?WmVaVUhkOVRKeElmdmwvcTZueDNPa3lieDhVSVFQZkxmc1ZvUGtaUkpNT2hp?=
 =?utf-8?B?aE9EU3FJVmNhNUwrQ1hqdDZYS3pKSFlMZjRQK09Qc2xwanRIZm1xNkxEODJ2?=
 =?utf-8?B?dzdKUTBVWlV0ZWJibDV0RUZIdHB6RFJleEhmREhuRjl0Wkdka2dFRjN4eWln?=
 =?utf-8?B?YUluUjFCc1VSUTFBSzkzRDBHalhxcFZMVE12UlFZMWhHcHE0OVozUnBKeXdl?=
 =?utf-8?B?bk1pQzY1aWw2TjVZbWRZWExXVk8vYzQxUmdLV0s2K1JEbXlXMXM0MmJ2VzRj?=
 =?utf-8?B?OXZQcEZTUEt0Vis3VUZzN3FGZFhjVTlnQmN4WGlZQ0lZRlJuclZBVU9GYmNm?=
 =?utf-8?B?b2V1cExuZEN4VWt2NHVBUFU2RUlHZFpscWtpR0w0NkJmSVV2eHpxdW1CR2ps?=
 =?utf-8?B?VlJuMk5wSVZHMU8xYlUwbnJGQTdqSU5DdzJUbnFIUGU2cUhzNUh0NTFHSEdL?=
 =?utf-8?B?K0U3TGhsWWY0Y1JOVnFFS1RTQ2RYWjV5c2RuYmcxRmVUYVJNUzY5YzRvTkt5?=
 =?utf-8?B?ZWxnOHRaTndzRDBFTjJmK3RuOGFaeVdRYTFPZUN1OWN5U05TeEY4QkpEaTJQ?=
 =?utf-8?B?WnZiWmduZnVYaUJOYkdkcXhYQTVGaXJlcGpDS0hBMVZzK21MSS9pRXZNdXN2?=
 =?utf-8?B?S24ydUI0TUxzeU84eTJNbjRvNzhPNi81UFBDOVhVdStYczFxYlVRMWUvNTQy?=
 =?utf-8?B?WXlQMnJHTXA4WXQ5VnVlamt5dmsvODlQSU9xUUV3MEdzYnFrSTlZeW11VTE0?=
 =?utf-8?B?UEJNcElkbTJqV3RVZUsrQ1lWVzBpU3BheWJ5V3JkWmZUZ1llaDc1Z01Kd0Nq?=
 =?utf-8?B?NEJsZnh2Wlc1dGhtM2VNWVlKV0YrZUgvdTBvd0IzNW1ES1d5NEZjN2tQZDg3?=
 =?utf-8?B?L3I0UXAvSFRXQ2kyMElEMUk2YmJDVDJmZmR5bnBMTVczbk1EVGFiVEc3N1Bt?=
 =?utf-8?B?MjF2Z2diMzJoL1FXK1R2V0dGaXVLWTllYTVrK0t1c29vWlJZWHBEOUpjeGRj?=
 =?utf-8?B?dkRxNWZoZjZkRmNKMFJzL1U1Vkg5VkEycjJveHZLRzFPdWVkMFJEV2dUUDdZ?=
 =?utf-8?B?bm5WcGtmRGFXeDZxV1QrUjJXY01OVjgrM0lLQXZpd1FGSldJQ1RjUWhYUGZI?=
 =?utf-8?B?T2NFV05JdkpEQWZsS0xOMmFxSENUdlJkazJ1UlJCSjZFRlhMcjVrZmc4RUJq?=
 =?utf-8?B?L2FXY0RlQXo3TElQU3plc2NVRmljSDg4VDJLbVpTa21raWVHK1ZGN3psMmdK?=
 =?utf-8?B?VXN1ekR1SjFjWWY5czIybFMxclpoL0tUTVlNU0UvajIvSjBGVVdaNWJLc3Vh?=
 =?utf-8?B?M0hQekJGdVVzU1hFMzBPR2xQRnUxa21RdkMyR1J0ckNvbFVMcEVqN0srYzBR?=
 =?utf-8?B?OHV0cTk2YzJwZHV3OVpEbVZ3S2todHlOQ3k5OHdZQnQvL3QvYjlsbkkzcys1?=
 =?utf-8?B?bG1jU2VEUU40UE5QNXBqeWNWMjlCSjVROWJ0VHBPMGdoN3h2UFVkSkdIV3NJ?=
 =?utf-8?B?MUFDdVIzWmwyZ3IvQmQwTGVSUHM3MWdQNGdjUkNNNDA1TW0vU3BQb3QrUmFV?=
 =?utf-8?B?dHJneUJTQ3FlLzRHTHZpOGdtYVZnWDAvRHBrVFpIOVRBZ0RhR2V2ekJSekJX?=
 =?utf-8?B?aW5oWFVaMGIxRENsdmVUcnZpYUNGL09xaGsvV1liVENOaTFLU3o4QzRDTVFZ?=
 =?utf-8?Q?ahFd8d4cL1LuMCX9QrpaQ9lgF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b2640a-cf7c-47ef-bd63-08dad8f0051c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 07:44:21.8366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: On2scJXK2roCLfBSUes9mXsn4EWheUKWqdFEfwLE+5Rc8uqfjHQ9TAGPMqCO6GswTF+kbJO1liX83wpf3zkYnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9142

On 07.12.2022 20:59, Julien Grall wrote:
> Signed-off-by: Julien Grall <julien@xen.org>

Acked-by: Jan Beulich <jbeulich@suse.com>



