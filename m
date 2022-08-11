Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E37CB58FAE8
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 12:51:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384409.619783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM5ll-00066t-EO; Thu, 11 Aug 2022 10:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384409.619783; Thu, 11 Aug 2022 10:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM5ll-000645-Ao; Thu, 11 Aug 2022 10:50:29 +0000
Received: by outflank-mailman (input) for mailman id 384409;
 Thu, 11 Aug 2022 10:50:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WeOc=YP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oM5lj-00063z-HP
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 10:50:27 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60048.outbound.protection.outlook.com [40.107.6.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 683ac3bc-1963-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 12:50:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR0402MB3473.eurprd04.prod.outlook.com (2603:10a6:208:1b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.24; Thu, 11 Aug
 2022 10:50:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 11 Aug 2022
 10:50:24 +0000
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
X-Inumbo-ID: 683ac3bc-1963-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z7GjgsP7z/+6dGtv3iqENnF3qvKLxuoiDeSxjzaIZJxUXjCB6o9wIhmlG5iqCw4uo8w0C9nZEz2B2zksMHwPGE1LxiOGhSMiw1XL+Ed5TTcA+neAqUw0ZNAsVVYgZiPGPG1Ih3Tw57TrPDHW1UleaZWZ6ts1A8Dkahx02dXgQTQktaUTmPrSyoKi3mvVmqHTYt/oJ4Bsr/tk1LWOoE6xFSPNC2/xwUOuoGmVhCp36aijJJppDO2s2YwVg+72o7pZEUYyySqVKPQL1EARA3/h6HEmxIoc81Gnkbpzx9qWu5qHsZACGqnAWaOp146l8bnewp+UIPERMdpjmhAh5LEe+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lDpnCa/aY01wPS17Ku8OuyEjns8Lv4hwQT1tefTIjXw=;
 b=V7tn39jHUSNpDyKvrvj2p5npptfBmHfR6eTc0+58Az+I9nPdfjkNYhG9kzYXhlr9YGzJbVZDOBy0y/F7PiPgRGiHKkyw/d1LJg1JhO05w4c8MVAN7DS8wjQCbA8nM4dXlMX6JO+Jf9E+/G9/RqC9D0r86Y/wIiv8kHlXJd5rLj8esDZTtkwiwK6k0/wn3isVpkPveFML/UFOc3mX6SVExjwdG4lJPuCJa7lZPLKJUHa7iyHLHLnTlCH9wfOeJfls8kMhqPty3RgM5EDhb08NltoKb+D2v5cP1HOTk8ARaJLe/h2/F+CIpdq7cgAtwIxl3VgVsWmkGmeSgyEQUrqgyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDpnCa/aY01wPS17Ku8OuyEjns8Lv4hwQT1tefTIjXw=;
 b=KX3sE9QEnTXV3wDquqegy4B4U1nkhjVamI665Ku1TJHpdsncjCveStzWFVVhGllmUoYrgk0+5f9wtdF7s4N5Fo+giRQbgODlLWXsMuA6fdcuySC5NVv6NyvYy3p2VxDGka4agCw/S9stBiRnVKsUU1eqmt1q5VHQgh5kxvRfFLhiyPoajXKLlNPRVHtqy6QVTEwYbNIS2nh8PVY5veg+ZCs55Gxh0npFyaieeBVFv7HN2AxWjFyZ3gG62r9V2KA1Gr7DMmELTmQ8SKnI93uAqJESCyMR7snpLkzYd6gD7ATcMv4h2puCE5RWyPgtGf/079ZsdkJBzbZqoqfqCHv/Gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5379b4bb-76c9-d7be-4bd7-2f75dde470a8@suse.com>
Date: Thu, 11 Aug 2022 12:50:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Rahul Singh <Rahul.Singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/3] PCI: re-work pci_get_pdev() and friends
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2954341c-9851-4dff-3c60-08da7b874b33
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3473:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6CbgTSgolocQa6hBv2AjmAI0Ref2QtUZ49mW34L08Dm4oysSWoUDhix+pKmha1JNYAHm6X0BfN23UTkzCe889sC0XlQRJkiZnCwx7jVAKea+7Onn6VAPQRPlmVVd/kfXhnQ+mzhkJv6orx+bZBt0/2AGVAN6nF+Y9LeeAw9cpM+eDz12W5JAvntvOiAkbyjpRl4i5U0cu0XOaktqwsdWAIx7+cf7+9YzA2sC3c0TtX0fAUNL9Vcxr4vYWu6mR+xk0kuKZPmqh44byEsb3vl2fnPRnsoMULQ+UzM2YHN/x4XRbVOnNzxT1Vnc5dQbkyGSjSI9Lzn8MVxbFFpycyfCNwwbuilPaY23MllattXVM5YNvSNHO1oo9dkQdAvpm7gqIV01VVr4Bgf4uM4ZuHYFSDW3FwudZSbB8uGRizr73foB4GNuL7FJDuPIw4mkX7XB1PDUR8xQSD6CGxxQhGi93lLco/HiCjcs5tZxqIbbVTTJtgB+2q6PUQi8/1wCRTeH855v2Fziap52wZKVSLY/sULv1PY8qOzVB55+7Ao5AWXInK0G9pKEmWTPepMNLgOPwjkC6krjSiMwi9VUM9isDUWLC/Zuih7It+IS2LJ6jrCEcqgFMorRaT4kuOWzsqkqNPDe8bVfrutPvlar4R4A9cdiSCXGarODx6DCjFrm3hUiowSvNCQynuj/MKp729jwHw+I4O3fYuFpJYZfanZ+MPyhZXDu6+7cPUqnODURcj10uGSq9UUQNwgPV/wSRNqWkKtOB1G/4Pd3UYXYMtltw9PwU3TjsRvzaIrIZu4kDu2JbRnkXucRLuOD5iVE1gjRK3/r/0H1BjxkUEOp5vTLnA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(346002)(376002)(39860400002)(136003)(6506007)(2616005)(8936002)(4744005)(26005)(6512007)(5660300002)(186003)(478600001)(36756003)(31686004)(6486002)(41300700001)(38100700002)(31696002)(86362001)(316002)(2906002)(54906003)(4326008)(8676002)(66556008)(66476007)(6916009)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGJhWlJ3dlplV3VYYWx4Rmcya0pCZzRraWRZTW54THFpNDJCVEt0ZW1WeS94?=
 =?utf-8?B?WjYwSzdGQVJrVjQ3TS93WWlRNXpuemxTbjAzR09DbjZEVUFhQ3JqaXpVcWVp?=
 =?utf-8?B?clJvNlRxZjNNem90OFFXTC9xRXpaR25JNkpOTjcvK0pXd25CeFovckh1bERw?=
 =?utf-8?B?N2ZvYWN5YlJ2QTYvS0FteXEyN2QwZmpCNDJ5UkN4dFRaRFVOWEUvNG43UkY2?=
 =?utf-8?B?TEY3SldNS1Rjb1VkR3RRZEFzTVhRT2FaK2JGTkU4SjBVOWZDY2ZjaUtDRjMz?=
 =?utf-8?B?YkpuV0l5MVp1ajB1WlFSN1oxVlVRcVdxVmhYUmpjRFNJcDN3ZzJ1YnpyYU9z?=
 =?utf-8?B?dGcwZlpqbVNJbXJkbm9XR1BxNGhCRjdTZWlTdTM2a1VPZTVsRUp5RHFwakJj?=
 =?utf-8?B?bUoraGg5bE5DeXRscTBkS1FKdFNpbXBmWGlmc0ZlaGxvMGwrRkxiSGk4ank4?=
 =?utf-8?B?am5sZHNRNlJQQkovWlZpeVRIT3lacTRqTlNzUE9vT2dPZXA5M0hJZG1tZFVp?=
 =?utf-8?B?UCt2NjBPMFdKQWlrbFQ4V0FYUVpaSEpla0plckg5QXRHWDdnMkwwRkQvNE95?=
 =?utf-8?B?eW52ZWVhOVliQWxjSUxNRGl5UTloRmdNRXkwRHFBY0o1VXJIdFpvY2ZEKzFm?=
 =?utf-8?B?K2FUUmZuOHNnV3BDcUxEeitMZjZjdzZ3aVNCQ2JyRnRHeEEvR0ZReDRyaEFu?=
 =?utf-8?B?UEZVR0xmQ2dMWmZZNTl2YXc3Y2tBK2FvVFFob2ZiTW5HWVQ4MlV6U3hoSEZ1?=
 =?utf-8?B?T3cyaXVlR1RsemRUbmI5L094bmphMUhkellpbm5DcG9NYmpNcjBCRWtXWTB6?=
 =?utf-8?B?KzhaTVBqS20yUUVnL2IzQzQ0WWZyZTJaVUhNZksyTXJEeW04Rm5DSWRxdGdR?=
 =?utf-8?B?WXNmb2kxQkZOTkFENjZyVHIwUnh2ekNPZjNRYjNwQkZPaGh2TW9DUnJQUjBi?=
 =?utf-8?B?cG9jN0Q1V251dmRNeFdWVFhKbXBvRkgzeDcvVnhjbFh6SHdLaUxrVWFwZDIv?=
 =?utf-8?B?VkxqZTg5Z2Z4UWxTd05qdlJzdzFIUFVOV0ZRWFp2ekltVjdNdmJzaURzNnVj?=
 =?utf-8?B?cWUwWUlBNUpxbjlSaURyU3QrRkxhQmgyOE9DWTNVL2R3OXEwUjhUNTZCZXVV?=
 =?utf-8?B?c3F2THhyZXM5NmxXWFl3RmRVM0gzVncxOGdWQXBKL3QvVXBaQzhYV214L3Y2?=
 =?utf-8?B?MDEzUWc2UGUwNFhTaDJHQUhzZkNyUWRZcDBjeVFkWXNtMThDNnFDY0swb3Ry?=
 =?utf-8?B?aGRhdVp3QUZwTnQ4anNBWGVucGd1VVVPVjdTd0tSMUVDamE1blpjTnNlSzQ5?=
 =?utf-8?B?TjY1WVFaclBBME1RTU1xTlA3REkwUU5BYWlGM0xZZi9KV01iZnRtV3BSZW1Q?=
 =?utf-8?B?SjA3Y3dTSXJkNFVuaThBU0pGSldidk1YR3g2Z1h2cnF5S2E5c0lMWlJ6bjZ1?=
 =?utf-8?B?eHNSbnFFSU5RTDlOREovNXRTQ3NqRDh0L0tRSzVNSUs0Z1Y2VU83K29HQ0VV?=
 =?utf-8?B?bENyZSszOUFxTjN3VVVwK2FYWXZQczVJc2Q3RGMwaG1pQ1I3Tlo4aHJ2bGdt?=
 =?utf-8?B?SmlOM1ZVdVlONHFBS3Rsd1luaXdpUElVVmpSUDJPYXd2ditUMEZsbVRiN3hz?=
 =?utf-8?B?OCtUc2RicnRhZ1RETkpMbEpmaUZWbHBHeG55RnBlUDVaRk53L3JMYXNhU3I2?=
 =?utf-8?B?RDdXTTNsZy9OY2tVOStmUzdLLzRGdXh5clpFTC9yNmc2bFNPRlhsYW1INjN2?=
 =?utf-8?B?cGNLOUREQy82aVF4aVpnOFkyK3dVY1ZGU1QxUXF0QnUrYWhUMExXOG44WDFx?=
 =?utf-8?B?eDBhVVVXVVJRMEhjelBYTWQ4TXR3MG5vUDNET0N1d3RqZlFMbjM2MzlvUGtV?=
 =?utf-8?B?Q3ZzNUZ2ditOK0djc0RkcjFibXdXWFR2Vm15clM1cURQSTAySEs5cEFncUhM?=
 =?utf-8?B?MENSTUtzVmQ4Ym53eEc2VVV2b240YnFlSUNNck5qQ3c5V0lHbFJ6ZEZySk55?=
 =?utf-8?B?WXkvL1dINDdCVngzYlRMWHhPekdwR0U5bnFiVjlDTlR5SjN4MjRET3hUbEJ1?=
 =?utf-8?B?R1ZlcVdnZ2cweGFjckJrL1BDOUxjdmZRR1FGMldrSXBYbWxhamdqSHhkQmZm?=
 =?utf-8?Q?YfbIL5FUTEB/k24GRzUU0xrum?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2954341c-9851-4dff-3c60-08da7b874b33
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 10:50:24.0828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jTkf37cWqIejR36tt55/olfxDv6bzzTM6oB7rdJoyMRgc9aaBGiJD1tRtuBf36iGEpzZoCyrJUL+PK3dRrup4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3473

The two previously submitted bug fixes can actually be had as a side
effect of eliminating a bogus feature, the last use of which had
disappeared a while ago. Further cleanup then follows along the
lines of what had also been discussed in the context of the earlier
attempts.

1: simplify (and thus correct) pci_get_pdev{,_by_domain}()
2: fold pci_get_pdev{,_by_domain}()
3: bring pci_get_real_pdev() in line with pci_get_pdev()

Jan

