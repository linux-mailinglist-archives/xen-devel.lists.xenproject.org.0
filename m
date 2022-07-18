Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B87F578072
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 13:16:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369645.601118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDOjB-0008A8-17; Mon, 18 Jul 2022 11:15:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369645.601118; Mon, 18 Jul 2022 11:15:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDOjA-00087l-Sn; Mon, 18 Jul 2022 11:15:52 +0000
Received: by outflank-mailman (input) for mailman id 369645;
 Mon, 18 Jul 2022 11:15:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pu44=XX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDOj9-00087d-Ad
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 11:15:51 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50046.outbound.protection.outlook.com [40.107.5.46])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id faa1c3f0-068a-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 13:15:50 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by HE1PR0401MB2633.eurprd04.prod.outlook.com (2603:10a6:3:85::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 11:15:40 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 11:15:40 +0000
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
X-Inumbo-ID: faa1c3f0-068a-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PUggHbvSrTyBGEuD/wOSwf/OJFbpYlt3KxRcROzp3ZrlyuGrg5e8BB556QgzaMUAqt8Oh4J+TD7taFrqet7BEop1h7BzUJl/NI5XUtE9dgQQHXMIg6r6hH7wz7M5MwGnLIW8W/C35+J+LD6UtsKhVjmfCVB3A4ukYINT7B16kVUeinZiHgcyEfvtJYeKjbInD9d0dL5EF2qkC7IUTshOC8tZYsGUBLVdUJ+9z9H3OXfO7VilqPn1rPP/a2FgLnXaEQr9D94zgx+rPIY++YtC3o3nXFs33vxobmrMYomgrWl6pqOFLFFcr7JWUAFsAs3OOZHoU6CL/gYrkEiymqynbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrzJzDDfQM8bY+LD7L7cRD1hqD7raNTDQ9IkFvLqrp4=;
 b=bXGWIgtvW+lFjyjYB8fov6uMXSVT7oypekNYDUB4cRKtLe877n2SDE5YqcEF0zKs1h9HNxgElJzErh0ql0s2SLxI8AUcl8TMIUypZvE+6wtvWWFvwfoTYtVu9t5Ap+8uqXrEA4ADvio4OEF4VPTjRp3bu5ojXRlwP35G0jrmu1V/XrVX2tSzDHFO3JBsqgolrsco6Z43E59ag4xf9u0nT4X+PiWQtR2ntSUXq4B0AnXIhwoR49WvfS6kbcgxQmGxcGXVBv0svO1hds9whvwDYRLIfuu4gBPCJCzz11NG0pfu0VoOpYSEcqmtVCw+dptIiG3+wsd+QI5EwB4QfK1kQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xrzJzDDfQM8bY+LD7L7cRD1hqD7raNTDQ9IkFvLqrp4=;
 b=e+9kAq5fjN4ESRmpifuIcY4Ra5Ugcn/pwcVEKp0GvMmSy8E269dMuTWa/5RmPUMOkZkOgHflUY5QNFqg2y4jSVDg67ISUncCq54r5e+90GbCX2jXpAj9DBJwFcbrpLCFn//47GvARECBMAHz0V1KJ4D8vMrv24tY44NX1DlrbSP87HdoH5PPHxxihKhEo8SIvmRyNDttSeE4zlNRJoavTOtzV784bZJPm6Rgtl4fUTED5V/nqh6GD5pfx2E1EG4MZS2QZ+7WXCBNzMd6xYSuMjtM70llqaPA+l7X3mzjpIgX0tohcVMsfm3no6siestXekIiYFXt3XIr6YqwIikLBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3c273983-bac7-ef14-efc6-5e729d1605a6@suse.com>
Date: Mon, 18 Jul 2022 13:15:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 5/9] IOMMU: add common API for device reserved memory
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
 <2538c56f6881e4e2a3e5cee3cbdeebb88a59ccb5.1657121519.git-series.marmarek@invisiblethingslab.com>
 <38020a5e-121a-932e-691b-6eaf435be7d2@suse.com> <YtU+BbncwbW2+X16@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YtU+BbncwbW2+X16@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::18) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09f86249-ce15-49f4-8bac-08da68aed919
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2633:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zQL9scJHUcNonCe+/+agPMiJBgYC+B4jP0ZOaV7DcNSS8fmKNx/maXiWarxFjF4bgN4R5wCVmPJWGAiAcMigEDnVk9qqZa2vImHqHEhrqgKYaFF4TLpblX5C5XuzCLJ5oeeAe700G5r8Ys11CWHIOZDIuWZvRTkRwVUrL5COArO0eJHle2WaqJzxJHte1YZKjTjVotweC/K9jl83vEEIFdJqvdTJ5INEBvpB6AHux1nJU7Z5HGOYkhHWYVx5O3i+9nu4x5fIEM7+ll3xdjkWgGpexTU58ZmBB8DCshTi9XChAW5BOwNp/6RehfHXH/ADmPGyyjVtRfcj5xQcqAuvPFezIfQGxrqBmYTl2K05fXyUV5Hb1xbw0LKysNv/KFXTOcKz6hR1fDfxX2qyhvb+WejRVBvJZSjikuV45LwO6jrq4yRqi5cTdYztwLH5EHeQTET/UJuRRI/JK0SJU1MiSmJ6jkurI3jpynHX01S9eu4YmROXi362WNxyk17LTBTg7O7ZCPm+QDD+YNkwLg1fLqSF0xMf6JxP3s9i9KzMljlS8SviUeLlwOtEEtqTSn0/fB1Z1LqGvTn1+HsoihEFEEa0B+YtWTTkr9JK+1z2hPZbSKXceuYiuJ3pVLYV/C0RH1y+L/a+Rtc7bUynTLEDtIH9e3qMDTkQ6fhBlvDRqMAPVbNNNEpCqD334GEG6HiLs7p8Yyhsyv+evwn6SgW5zlTUwY2oMnAXbzmU/OOdMfDVjDhCvqFM/HB0g95iMHXZ8ArNIfHTAOF8qqBlTwXmDmIoZ9RzHpeiQ9rUs1c2Nhr3DsbAdr65XvDpYXlPfVut+4e9WTV+G5wfMC3hXfvDKA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(136003)(396003)(39860400002)(366004)(2616005)(6916009)(38100700002)(86362001)(36756003)(316002)(54906003)(478600001)(31686004)(186003)(53546011)(5660300002)(66946007)(41300700001)(8936002)(8676002)(66556008)(66476007)(4326008)(2906002)(6486002)(26005)(31696002)(6512007)(6506007)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RklsR202WStoZlRDV0JmRkxBWnRCMjNVWlVDWWViQVVjcnBFVGJFNlowY1Nw?=
 =?utf-8?B?VDV3Y05NcUF3aHFhcHh0RFBZWjY0MWFYM2Ivb25zcnRzcCtPTDgxdmJxaWt3?=
 =?utf-8?B?UG1mMXFOcmJ4Q2N2elBXMlNHTUxMa3lPamdMK290eXRrQUdrbGxZQnBQenZZ?=
 =?utf-8?B?WC9ITVhEMGVtd3hQNmhERmFZK0hhTTkzcHBoZkJDVnhHWFVyaDlvZHBRYmJH?=
 =?utf-8?B?TU9FSEdhNXJSZmpNejZsZ3ByUzZseTRDamZpaWtlMTVDbHpxbFRFMzVTbEpM?=
 =?utf-8?B?S0Z4T3RoKzJPcGh3T3NualZ5MjhrWUJCMlFVemU4djRlcEsxZFNpK0k3RW9i?=
 =?utf-8?B?aUNTSmxFcStKRmQvMUhocnptZHZEVWdNR2doZVZYeDlsY1ArcmZmVStQV25l?=
 =?utf-8?B?TlVYSnBJK0FhbGdoQTNqWkJmZG9zRmFPS0JMQnR3b1AzWEZ3dXBNM2RjdlR5?=
 =?utf-8?B?T1JKYkUrYWZVMVQxd1lvY3lacjFGVFNGaTFkWHYyM1hubjJrL0VmbXMrek1W?=
 =?utf-8?B?N2RuMGQ3WTgrNTFYL2hOa2gzNUhSL3Q2T0hUeXRKY3R6MlY2SGYwMlRhZ0px?=
 =?utf-8?B?cDZMY3VIbVc5MG1ITVVGU0RVelJUZ0R1VXFlWVdQY09JN2cvQjE2YjkybzN0?=
 =?utf-8?B?ZnQxUDIyZ2IwS0VQQm9PNUNhQ0FkOTRCL0NMZ29NUlB5Yjd1d0RGdlNTVCth?=
 =?utf-8?B?NGpkQ2FvUXVYSks2R1lQbWtGMG9Ia2cwVnZzMkEwdlZ4emFWamZtbUxYNitq?=
 =?utf-8?B?c3BFZE9keThIMGZ4MXZabEtmNU9rTUlkU1hMUUI3aFdHeWZkd2Z0Y2Zjam1V?=
 =?utf-8?B?cTJCSDJ1NFU3VE5leVpzZVp5YngwVWdxNnhCb29WUVVWcVUwMlh5ZXp5VUVK?=
 =?utf-8?B?UHlKcS9BRVFmMks3ZGpZUDJYbEE3T3V1eDdkYmMvTWtlR2ZrVURWdnZXd0Jk?=
 =?utf-8?B?MlJuMFFhSm9VSzJWU0VsVHEyVzhFZWloOVNqVGNTTzZtalpuamdtZ2FrUzNj?=
 =?utf-8?B?cVJkbFdNY1lvY2orTUtZYndrNUtoRCtyZkt3RkZEMGd4YS9NYkZqWGI0eWFq?=
 =?utf-8?B?MlJHS3R5Z29zczdDVE5ydVp4YXcxYk9rM2Jjc29UcHdIMkhiWmNRSmhBeEcw?=
 =?utf-8?B?UlNQYmJjTUVmOWxJbFBsMHVCeURSUFZYYW5oS0hodDdmemtySUdYSGtyQmUr?=
 =?utf-8?B?ZTFTQW5EU2hrcEMrNkNxMmFWa3ZMTWlwcVBqaHYwenFFWEI4UnJjZy9oVVg0?=
 =?utf-8?B?Zm5qTm1xcUVJSkZoWDM0Q0ZFLzd1OXBBakMzczBsTU93V2haWFBla283QzNz?=
 =?utf-8?B?ckZNTVo5MGZRdGhKZjZFN1JTTVBNL3BkZ1QwNUxXSFF2c05DZFNrc3lLZ3JL?=
 =?utf-8?B?Q2FqL2lZWEdxOTIremhjUlp3TUZPNlFIakZuUVRMaVREZXlsdFdLaURUZ2NM?=
 =?utf-8?B?SnU1ek5ZSmFIOE11RFpjeDM0OEkyTTRhMjd3WWFPUGpIQS9uWTJRZGVvVGdB?=
 =?utf-8?B?MEVQdEovS0lUcXliOXhPS0NEWldSOXBGOXllZ2lHejM4V2pnNi9ldEFXZThC?=
 =?utf-8?B?RFVJUGh4U1pHMlRpUkRQbGlBNzBlcGlPeTU2bWZ3bnRjNFhhQlFSblh3eUhN?=
 =?utf-8?B?QWs5K2MzKzRyT3FIRURTT3Mydmc1eGZWak1WMkR3S2lVWkhxcjgyZ0tmaEEr?=
 =?utf-8?B?c3A4K1duZWVDZ1E0WmkvaWN4dFNmY3BwcWsxblJPSExXbmtVSitCSFBWdWZl?=
 =?utf-8?B?dnA4OWRRYzBNMWh5YVhXY1BkSlpqRkNVSDIxSW1YY3F4b3U1aDBNTFIvcmlE?=
 =?utf-8?B?Z3lZcmpoQ1ZTcGl3cW1IUWxpcDNTN3JKMHBvWHQ3VjdyUjFMMUhlc0lsWlVR?=
 =?utf-8?B?R1FKOFBLOUJYb2pQMTlyS1c3Mi8wSGcrbkM5ZEcxaGF2eWFqMitFaHByNFcy?=
 =?utf-8?B?T0s1R0tCOGZiZEZOVmtVajJMYnVwYm5ROUlKQWRXYzFqM2ZZU2pMK2J0dkNS?=
 =?utf-8?B?TXB6S01BempWSTdyS0JIc3ZJS1MrdkNzYTRKdFRCQ3B3MDg3VTBJL3hISmZ4?=
 =?utf-8?B?T2lGeFRlRjBrdVFjeG0zZEJYV25DcE5WN2ZTMWNqOEdNd1psaFFzV2lUZ0dB?=
 =?utf-8?Q?Mnl6j3e86iOeDtMr+T7e7dqfJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09f86249-ce15-49f4-8bac-08da68aed919
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 11:15:40.3368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GoscZzy3DGFgtvyIA10POZD4YEsR59VTz+ppiu1Cq2ANP863GyjDjFpHQmy++113QH6Cnz1VlWTN2y7+esFRKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2633

On 18.07.2022 13:03, Marek Marczykowski-Górecki wrote:
> On Thu, Jul 14, 2022 at 12:17:53PM +0200, Jan Beulich wrote:
>> On 06.07.2022 17:32, Marek Marczykowski-Górecki wrote:
>>> +};
>>> +static unsigned int __initdata nr_extra_reserved_ranges;
>>> +static struct extra_reserved_range __initdata extra_reserved_ranges[MAX_EXTRA_RESERVED_RANGES];
>>
>> Overly long line.
> 
> I can't find what coding style dictate in such case. Should the second
> line be indented (and how much)?

I'd recommend

static struct extra_reserved_range __initdata
   extra_reserved_ranges[MAX_EXTRA_RESERVED_RANGES];

Jan

