Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AC16A55F8
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 10:38:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503176.775366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWwQQ-0003fN-BZ; Tue, 28 Feb 2023 09:37:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503176.775366; Tue, 28 Feb 2023 09:37:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWwQQ-0003dA-8X; Tue, 28 Feb 2023 09:37:34 +0000
Received: by outflank-mailman (input) for mailman id 503176;
 Tue, 28 Feb 2023 09:37:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWwQP-0003d4-Ie
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 09:37:33 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2077.outbound.protection.outlook.com [40.107.7.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85e193ff-b74b-11ed-9693-2f268f93b82a;
 Tue, 28 Feb 2023 10:37:32 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8813.eurprd04.prod.outlook.com (2603:10a6:102:20c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Tue, 28 Feb
 2023 09:37:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 09:37:02 +0000
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
X-Inumbo-ID: 85e193ff-b74b-11ed-9693-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EXysbhGFEtcux0JuE3hzT1Y/GVNZpfrVrosEIfndCbQuyCD/RFvojIxRr2+uZrP1Wr9dMk5eaxBo4PmIMmeXHk4oqwaRWEEs84ot4iPAjwIAu4WTxbck6lhkILrLGElnw9iM3B2BsjataqoZyM9CKmDyfwO+kbQ3JRdx9St+qQnL+Pt31HT98YZqegpPoxpIbniRP3u3evIzu1uQTYwr+7Itxur+u/VtHRd/zISsa46gmqEiQm/OL0VogttA/BnFkTX6uQDca7JKlPeRgXsrUt/ouvKRq7kowEwh6jZjTAstw5V8AoQQfFjIatX4bom8BLeeZGSiBGU7WUhAbzHzBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DUo9hhtsh2qK0R5RTd8vtESoDn0BCRVKKsPk5hb6YAM=;
 b=MFBcYj538PBUMHOJ/gbV6TA3cw6cSaINGBrfhXz4QvFyebdS4KFFrMNun9epGJPNpdylnoYSOdLekRQwpm56+ybGHqFvk0uy770MkvZ/zvzw5DYoyT0W3bf/AzOFSKcQ4J0nWnO/5MdIkz/9sZyPENtjZ2FCF7JHw0WgwS4OzJB8lV6iHzpDNe2o4uhIyhKc7p3WksqornISSL/+grchSJ4YYN7JqTBjRG3HOXc9VKJCj9EMfGrAVY1q3HRVoaD09aZ0LO9d7N1Qqvd0NxZHaTjO8Yet9VwURX2nXOO9QJ1G/hlak9RJcHRuWip4+nPDkIiyr5ZUtpKaZI/TpHHxdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUo9hhtsh2qK0R5RTd8vtESoDn0BCRVKKsPk5hb6YAM=;
 b=an1z6gC4BgjlLD0l8RHCDBCqTV6cbflhpwaTtgbQf33D/fVbMllKUaRp28YlHM7S0/Jl3MkAeRGvPaKLtuF312XtZo/OJoQ3AbFS1PU8OdB//hTQyLrq0CeKWO6IGfnxAhEmZ2i6QR3Yg8a9zTBHgCS9mmFEViMIGOSV/3Ca2b4rl0ud69DnF83U2Lw6Bj7sE8RNNe4wB4KTdjxISUfEWavuctgKaSMphTpZbU3oAbtuR85B3Nn9mUOVn6ixpFUdKskq4x0khx9P857syhDRnmmqfELhReFmfZi3ScJwGgDNNeooSDtDX0VRiN2VBJaZp3VnlSbPZ4T7gEC+An+Dyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <467c21e0-e41f-3d52-f5e0-8bcc70bfc923@suse.com>
Date: Tue, 28 Feb 2023 10:37:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Is xl vcpu-set broken
Content-Language: en-US
To: Joe Jin <joe.jin@oracle.com>, Anthony Perard <anthony.perard@citrix.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org
References: <792d9693-7bb1-9143-064a-d3687b78415f@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <792d9693-7bb1-9143-064a-d3687b78415f@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8813:EE_
X-MS-Office365-Filtering-Correlation-Id: ded17739-3d99-47c2-937a-08db196f58ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QJcKQI5Wx/ke7tN0zDWvIzAdncTyvjp0tZpBtaoeZPN2+8Teplarhc/7VHQZXvguQ5fyFfxfWsENhLVNf5tIZqfXW3Y7rRMuMzYtPTVRqmpiHF7QOHLqQmN3ObmwLabbsaoVZQBQCd1OOxOVvi3HQHeM5qKMjMcZ5Z/BjPodvXasGRfBOAYbVH9CcCVG3XupRgUsixj5fY+OKTtmp9+CJjUA09UTfu8+kVP9fNz8r5dA9nas+Kq/ySuz01AN2zOEfRg7hSx+sws4/H1tCYC1Po77LItAdGNgPegMeMDi/3q8PP5vBopP0GWSDkAjnfMcpBCzKWW6a8tx6CLe9wxMAudV0b8gXEnYo1r4wESnN07YDrFHhk7zBo/E2vb46CsNxSwyLzdLJhpod05SLEQik/QfxHHEX7REI7J7eKMtKNHo3RUsKRQ+XrKZCv8+BPgYnIOyk8gZGkRt7y0B+P9/pAUWOe4GpHWmGUrFZN0BeQ7akyxowreW1NrBAfcB0UPKKJbq73WHkYl7SkLZQcxE6vqzMOk7z/Iuh81O6GGbQXWku6TzKDZ28m2a9xjLlZV5GmrWDcgot/uTlgFBkR1QK6MLKAvhLRGPlsNYFjlgPhJVCGWsW1qEM+DbieJ6B1JAHQB0n8nV6rYXlQpQfF2F49YCkgswqiEB4YYMWMERfkxNiu7GNiqEXU6+eTSMIrGU6h/uwIUxD3FaOST0oWeDRsqo94nPaf+vhSgfaAo7VCE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(366004)(396003)(346002)(39860400002)(376002)(451199018)(3480700007)(316002)(2906002)(31686004)(36756003)(8936002)(5660300002)(86362001)(31696002)(53546011)(66946007)(186003)(26005)(6512007)(66556008)(66476007)(6506007)(4326008)(8676002)(110136005)(41300700001)(38100700002)(2616005)(83380400001)(478600001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFk2dDl3SHNmeHNtZW10QVhJSmpWbEg0YmFXQmVGaHh0SWJyZEtOanFvSDhI?=
 =?utf-8?B?UVAyUHdsSzhTaEJnWGN6NW9GZ1VvTFFsZmQ4Nm0yVHdaYm5JK3BqdlhCTnMz?=
 =?utf-8?B?bjFWaFlCcTRXL2k0RUZDeDdFTEFaWGtKR3kxNEJuR3JFNVgzVzVHbEZLci94?=
 =?utf-8?B?REFsa2dwOGFRL0xXMGdGTWQ0QkhLVlA3bmk2RXFNY3VUM1doMWdIbWRxMjFy?=
 =?utf-8?B?N3UvVVUrQjVKN0ZHRUlBQnBmK2ZlYW01eXRmYStnUTJOam1HWGtFdWhObXdF?=
 =?utf-8?B?R3RYbWo3ZERPS2EzVFVzMDFNeGRhQnpLN1lWMm43cmJ6SXJVWFAyZVFmU0lW?=
 =?utf-8?B?c0dHMDluSFFVSU5tcHFGckpqOWM1T2JYMzRnQW1IWERGb2pBMFl2Y21aYlFx?=
 =?utf-8?B?emhjcytLY2ZqT2g3SE5sd1YxS0FZY0p4d28veDluZTRHQUxKVjVwKzZRcGdF?=
 =?utf-8?B?U25vRHRZblgxeHE4cnpsU3Z4MTlzaldCUTFDNzhzbmdvZDRJZnh2L1JUamYr?=
 =?utf-8?B?dW5tWXpYOGs0UldCazVxdjNNQ0JJNnpqUnkvYnpjUVgvSFY3cndnSEgybEtp?=
 =?utf-8?B?M0hSbjl4R3ZySFJZa1RrZTJ6TFppenJqOHA4UmN0TXpJNlA0RTRMRm0rZG5K?=
 =?utf-8?B?UlRPR0M2NENNSEtpbE1LWGkxbHg3K1lYZVczY0s1TUxQNXJQS2lvSi85cXRo?=
 =?utf-8?B?eVQ2WHE2R3dncTZHMDRuTFIvTDRSUkVBRGF5MGdRcUJ0bXNHWlB2MzRGWnpP?=
 =?utf-8?B?d3FSaUdPSGpGMUJnU1R3UWtJRkJLMkR0NWZYSGZoVm8xMG8xUEpUN2J3bDF5?=
 =?utf-8?B?T0prWmk5WWlBUE5pSXRkYXBYVUF4THBpZ3YwYks4Q1RRUXBEMjVFUkdqREJQ?=
 =?utf-8?B?OHhxUTBWTTNzYTJ5am5xaWM3WUdOQ2tBeDllNWFvNDBod3VkaFNDN0crbUpH?=
 =?utf-8?B?U3dNRkJQR0pTVVhtUWRuTWtNWHZqU3VSRE02K0ptZmpldWx4L1c4UUlYMUlM?=
 =?utf-8?B?UE40Yllhc1JQaEExTHJjUGt6NGIya2hmWmtSVGNLd0NUSmxNUHcyckhuYzZZ?=
 =?utf-8?B?OWJ1L3ZiTC9iaG16U2JwUU5qVWM4MGZjTE9qaTdiR3lUajRZWXMvZlFsNy9a?=
 =?utf-8?B?dlVmb0VUSkxHbC9YRVRvUlQ5a3NpVXJYMXpMUjhJUGtZMGhvWi9YTzhxcWdV?=
 =?utf-8?B?eGR4ZUY0SWxYeFFZN3g2MFZLcU5LMEc4YWhqUlE5d1VuajN2R1ZRWnlaZ21Y?=
 =?utf-8?B?QStObmEveEtmd1FqekV0SlMvR2I5alh0bzRQYkY0b2hBUHY4UHJRWjBSWGtX?=
 =?utf-8?B?ZW91R3REV2lsMWNqdUFCQzR3K3NYMVF1S2RjelY1QkRKaVM1d2IrSHlnR3RG?=
 =?utf-8?B?eUZMOGdzR1FCQ0J4S0VQUkdIWmpnSllIS1lRdXVjTHBBR2x2Njgrd0NHd1NI?=
 =?utf-8?B?SDFJUFR1Q1FFemRkSmgydVc5aW1mRTZna0prY0hpU2ltNEtLWVprY0FsVTFY?=
 =?utf-8?B?bEdFYXVHQUxZcW9LWHMzR2dsYmlxMXYzZmx5Z0Yxa0RjRXdMRStxUHRKZHVx?=
 =?utf-8?B?QnlRaGF2Yk02eXByZ3JQQ2g0cU9SRm1vN0RyNTlTMXB6NWJUSHV4dmFDSlRF?=
 =?utf-8?B?Nkx2b29LeVllRmd0eFp1L2lGVXJQRGJLNTRVWHNKUGQ3ZDB0dm80dEladjBU?=
 =?utf-8?B?ejQ4a2VqU2hUSjlSRHNzejRHdUtkQTBNV0pRVDZ0czZkMXhZMmZCb0M5SWlv?=
 =?utf-8?B?a1ArQ2lHZitLeEJUemJDR3dGU2UwODZWZ1hLN2ZMV0FCWWFleTVWNmZMZDlz?=
 =?utf-8?B?ZVNEYmJpWDJDNm01K1R1NDFxc2c4SStxc3FoL3JVWnJWSVVvQkNNZVk0NGl2?=
 =?utf-8?B?WnpvS0s3MEJFeHZHeE5NMm83OXNROUkzR3o2OTljV0RocEQwNkp5SnBFejFV?=
 =?utf-8?B?K2tDWHZTOWJMTkQzbG5DK3o3S0JodUZpS0tiNUZSaERMUW1neGtHOU1MTll0?=
 =?utf-8?B?Q0g5YU5VTWpabDNMdk5BOXUrQlkxSHE4ZUl2NHRoU2JzNXNkenpzU1dkUkVt?=
 =?utf-8?B?TXk2bG9xdGgybHNaTU1mMWNobDBsNEl0M0lxNXExVlVYYlV5WFg3cklVNWRG?=
 =?utf-8?Q?sVM8qHu2edkV0JJ+LLU+4UFm/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ded17739-3d99-47c2-937a-08db196f58ab
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 09:37:02.4479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w6O3OGrrMhawSgcSWgUBfgHRVfPtiMB9X4Wb0uTfb44zieRlmTDzPFsZlDo8/krTxAQwAT2XPcnSTP1FBPH3yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8813

On 28.02.2023 07:44, Joe Jin wrote:
> Hi,
> 
> We encountered a vcpu-set issue on old xen, when I tried to confirm
> if xen upstream xen has the same issue I find neither my upstream build
> nor ubuntu 22.04 xen-hypervisor-4.16 work.
> 
> I can add vcpus(8->16) to my guest but I can not reduce vcpu number:
> 
> root@ubuntu2204:~/vm# xl list
> Name                                        ID   Mem VCPUs    State    Time(s)
> Domain-0                                     0 255424    32     r-----     991.9
> testvm                                       1   4088    16     -b----      94.6
> root@ubuntu2204:~/vm# xl vcpu-set testvm 8
> root@ubuntu2204:~/vm# xl list
> Name                                        ID   Mem VCPUs    State    Time(s)
> Domain-0                                     0 255424    32     r-----     998.5
> testvm                                       1   4088    16     -b----      97.3
> 
> After xl vcpu-set, xenstore showed online cpu number reduced to 8:
> 
> /local/domain/1/vm = "/vm/aa109ea0-2fde-4712-81d8-75f73bd73715"
> /local/domain/1/name = "testvm"
> /local/domain/1/cpu = ""
> /local/domain/1/cpu/0 = ""
> /local/domain/1/cpu/0/availability = "online"
> /local/domain/1/cpu/1 = ""
> /local/domain/1/cpu/1/availability = "online"
> /local/domain/1/cpu/2 = ""
> /local/domain/1/cpu/2/availability = "online"
> /local/domain/1/cpu/3 = ""
> /local/domain/1/cpu/3/availability = "online"
> /local/domain/1/cpu/4 = ""
> /local/domain/1/cpu/4/availability = "online"
> /local/domain/1/cpu/5 = ""
> /local/domain/1/cpu/5/availability = "online"
> /local/domain/1/cpu/6 = ""
> /local/domain/1/cpu/6/availability = "online"
> /local/domain/1/cpu/7 = ""
> /local/domain/1/cpu/7/availability = "online"
> /local/domain/1/cpu/8 = ""
> /local/domain/1/cpu/8/availability = "offline"
> /local/domain/1/cpu/9 = ""
> /local/domain/1/cpu/9/availability = "offline"
> /local/domain/1/cpu/10 = ""
> /local/domain/1/cpu/10/availability = "offline"
> /local/domain/1/cpu/11 = ""
> /local/domain/1/cpu/11/availability = "offline"
> /local/domain/1/cpu/12 = ""
> /local/domain/1/cpu/12/availability = "offline"
> /local/domain/1/cpu/13 = ""
> /local/domain/1/cpu/13/availability = "offline"
> /local/domain/1/cpu/14 = ""
> /local/domain/1/cpu/14/availability = "offline"
> /local/domain/1/cpu/15 = ""
> /local/domain/1/cpu/15/availability = "offline"
> /local/domain/1/cpu/16 = ""
> /local/domain/1/cpu/16/availability = "offline"
> 
> But guest did not received any offline events at all.
> 
> From source code my understand is for cpu online, libxl will
> send device_add to qemu to trigger vcpu add, for cpu offline,
> it still rely on xenstore, is this correct?

Judging from the DSDT we provide, offlining looks to also be intended to
go the ACPI way. Whereas libxl only ever sends "device_add" commands to
qemu, afaics (or "cpu-add" for older qemu). Anthony - do you have any
insight what the intentions here are?

> anything can block cpu scale down?

Nothing as far as I'm aware. But if done the xenbus way, the guest needs
to watch the respective node. Yet on x86 that's done in upstream Linux
only for PV and PVH (see setup_vcpu_hotplug_event()); as per Andrew's
question the assumption here looks to be that you're asking about a HVM
guest, though. And of course it can't be blindly enabled there, as the
"online" operation should not be handled there in that case (or else
there'll be colliding onlining requests from ACPI and xenbus).

Jan

