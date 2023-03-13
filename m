Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CFD6B7173
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 09:47:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509152.784433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbdpS-0000Zq-5a; Mon, 13 Mar 2023 08:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509152.784433; Mon, 13 Mar 2023 08:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbdpS-0000XZ-2O; Mon, 13 Mar 2023 08:46:50 +0000
Received: by outflank-mailman (input) for mailman id 509152;
 Mon, 13 Mar 2023 08:46:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ddKj=7F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pbdpP-0008Ow-VO
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 08:46:48 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96695887-c17b-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 09:46:47 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9844.eurprd04.prod.outlook.com (2603:10a6:10:4c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.23; Mon, 13 Mar
 2023 08:46:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 08:46:45 +0000
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
X-Inumbo-ID: 96695887-c17b-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JdHjN1LS63LQUMT8R/73jy7M5z6yFZDL9ZSoI+Mx8iFX6EnLdmHRj8YvDL+jTq+NfQCN8yYFi3w7tSDYk6uc1S1FSzyxEI0jsREtKA/9os2B7P6K0++vYRlqRhn4LvzpSqNy5tdvp5b5W6z9hJMMby8i/vgc+0BymCjNGsoce9920E2j45uuBcpyIYBF16UHMX1qMUMxB0HgL6DqfxKCTiV4qWNJSudq1T5JdrJ9GjLyBJtoqpXp20CIhecz61k0GuGYQOI5o/S+tPoSQPq+W4H91jUAA4Qx6r31AcQTcsjekA7/ELk/4k0l9aZMjeolwO+HZLxmZ8gQ6/T7CvODpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QM65XWZChnp/IbEichNlsNpx2rl4vgW+v/jsTyHVCXU=;
 b=TyacSM7A0zAgUPW86hqpZkMTJsHNIDsuuhtidLDlrwkIBDcmAhsXYi3NEkhaxYEmbJpGRTxOtSRPBq1Tpay68fhvCXkaLs8LJ4J3eIsFUSnPeOCNeIGHhRwTHsIwWYIynnVG9k8cSzUbRNOgKzElUZHc+clEjdStuxEr97Xi+Q1wvfuR/B+TA8M0H+izIJW74pBYoFHDHKxVprnQ/z/7wpYEA98aJDuTl0K4vz4K+E8FX8QRjzHSUjKxH5SZoL+JH5FnjOafy1GUP8hSqo2A7Yuzgx/HYr9OVw4n6VRZZoTN2P0hPiKbcoI4Le7AJS54NlYaThz+OiHIznQuA7w6rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QM65XWZChnp/IbEichNlsNpx2rl4vgW+v/jsTyHVCXU=;
 b=BEe50NI9i5946xfSdg4m5DHxNhdKzsrLunFwCQ3AYsuCvLvRDlOD8BNoD9fBXPAGxK19veGheMNDfL34sO7QUER15arpJrGbCM1fNuWUXmJvPzy7EE4fFgAOOs600BxyKw5N2VoOynU/2vALzKDhVkd09NOM4cDMzOoBdguL6RAtcI0Dkn2l9hA48ONhfI2cKEeZ0s5NtEiFZ6qFd6w+5TohIXHN5vnKjkECct72/dmUopNnX+/gcpD0b8UzwQkR9wdveXEFmQpGP7tWa0b0ftGRMyGgqKMyxy0cNfPO2UzMIuI7cwPlo3fZj813DeE+vSQdAptSMb50wuer69b4Xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <557b5875-bb3b-e319-ed61-59ce6769355c@suse.com>
Date: Mon, 13 Mar 2023 09:46:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC XEN PATCH 2/6] vpci: accept BAR writes if dom0 is PVH
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-3-ray.huang@amd.com>
 <d0fb38b8-455e-1210-0f26-9ee7c4335e69@amd.com>
 <e292ea24-606f-24c7-ee44-34d55f7147f9@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e292ea24-606f-24c7-ee44-34d55f7147f9@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9844:EE_
X-MS-Office365-Filtering-Correlation-Id: d3a5de95-387f-4cc9-f6e7-08db239f796a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	srUsrCM1xVQhfvrxKNOwsqE8ZD+FnJIt8FMGuLow752UvKN/4GYh3WGGyuVqi9cu/nWpAHk5acmdXgsRbIBbf9iaoaVx/gWT59C+3+ubTsQhf+E8/zmCZS6Sbj0lHtVqyqIwJ48FNBYwde7QBkDkrvASBP9d8DhDOPE3vWm9zPVbNnIviENhvVSu4B71W/qcNj6EolnUJRQTncw3W8n18YCvbyjotXEyuoXjXjlQtviGKAOj9p6uBl3Sp8vS4F7C3nWD058nYxMWHjWo7L6dhMBzhug8sammmhmvhld43eNHu3fTWWN8iWI7FoEUNWtRrsD6yjw4gQ/DoxmBgzZO3BhTHTvog/OnNwfNPMz3wwSHhm0w5tunPqmvXl97d2wL3/tOLdHDaDC38Pp4L6mModWiENA9ncSpG7Jf1Qgs4bohnTPDssZng3t41lYF5Pmn57EhuurDyToSQv7qBP0o87FN4b0xjKstr5uQckNxjWTG/KYbE5ghY7XmWvC7QXuXsaJ3nXId9NEwrkhmNkgRHe5qRk150/VB4I/AMvP5Xd0deLjxMJr/j8rDOlZbMHeQdsDuNPvAfw4D76k5/3GPZw4zUg5XNBUeIFoaiDqe7SUs97+jcFfhSWZmZjPNP4LU02p08ChfLrkZUXb4BNB9S+ITSsGK9ben6vssoeTavL/QYrUsDwyv+96Gk5hGTsmV/J8JW8lbRuQzHb1SkIOrshdume5OSaCSxsXAzVMaNz8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(39860400002)(396003)(136003)(376002)(451199018)(7416002)(5660300002)(4744005)(36756003)(478600001)(6506007)(26005)(6512007)(6486002)(2616005)(186003)(6916009)(4326008)(41300700001)(66556008)(66946007)(66476007)(8676002)(53546011)(8936002)(86362001)(31696002)(54906003)(38100700002)(316002)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXh4ZFppbUY5djhIYmVrbStUN3FSZUwyQ3UzcWNwclA3ZlFDRzZyNFR2SXUv?=
 =?utf-8?B?MUhlSmFWdGdKb21yVVVkOFZ5b21lQktCL1NiQ2FRSTAvVTdRQkxaTDZpQWw1?=
 =?utf-8?B?NVdWdEhYeXkvNUIrMm5zSXliQ0MvSTdJNnRKbi81U2EySm9SSEZJSWMvRGl5?=
 =?utf-8?B?SlNLQXNaZDVmaXFYMHI4Nm8rU1E0dHNtRC9BM0duTWtKelBleW1QV2pLUndP?=
 =?utf-8?B?WHhSdlltcnV5Q1hUeVlNdVFTYTRFUzkxVDJEWW5TbHM3dkVPMWFwKzFYcnk4?=
 =?utf-8?B?WkJOaTRDdHRmZHA0N3JBSXVNRXpiUmppWFkzOG1vNDJuejNhOXhZV2lJTXFY?=
 =?utf-8?B?NVRBWjEwcVZsaEx5NmFQSURrWllMS3N1SDRad1R0eC8vS0RHQ2F6cEJYQVpP?=
 =?utf-8?B?L1hyMzRCTmNJZGxUV09FV201SmduaDFIenhPS1NCSTZkNnF4Z2ZoejIxL3Ny?=
 =?utf-8?B?Q1lMYmQvNE1kQ1pheDd5SkxLOTVoTzlqZVZBU0RKeS9VcVdkZmo3eEhUMm5q?=
 =?utf-8?B?NGxFcFU1MDdXV29ZR2FpUnUzMDNuRC9lSElaa3ZUSDBBT3RYY052RWVjcXFq?=
 =?utf-8?B?SDNBbFhkZktXZTA0U1p1K1lxZFdpK1NFN1p0bHg5UDFIclRFWitFZWhwak1n?=
 =?utf-8?B?VVkxakZCTjR2WlJ0enYwdFBzMkNNcXFaQ21GcC95Unhvbllyd0ZOM3Q5eDl5?=
 =?utf-8?B?aG1icE53NlhjUWcvdzh5SHNoOUpQUGJxYUtuZnpDSVNWV1l4WWwvMHpnYnV5?=
 =?utf-8?B?Z2NuOXRnRWwwWDdqbDN4QUl3YitDdTBVYTBYck4xYVFTODRMNnVhQ0hIZGl3?=
 =?utf-8?B?QnRTaG85WXg3MGpTU2Y1K29KOWNLME5QUlJEa0x6dHYrUE5SdEdra0ZJSjdq?=
 =?utf-8?B?cjVoQjBaUkk5Zk5FSXJ4dDVQanhtemdCQVh4aXpyMmxId1RyUTRoa0c2cGpF?=
 =?utf-8?B?SVdjZTdwenFTL0phYzNXMlRhS3RFVHJTK3Y5NGJFekQ3TmtrbmdNQlBId2F4?=
 =?utf-8?B?ejZZZFRyU1MzZXRoaXBxQ2FKc040MDZtV0x3Vm5yV0hTK1YyOENvQjhYNkRO?=
 =?utf-8?B?a3JrWjJEbGlTQVhYMytQbEhOVEJjZmwvM1hXakxPRU1SMVhpVlRHbWU4K1gy?=
 =?utf-8?B?REhlOWVQWjErcDhVRzYycTRKeE5LL3BDeGhVMHZ4ZktjR2FOOEJUc1c4dGRF?=
 =?utf-8?B?WGtqaVVnV3JKVTFnZENpc2NtUmo4WlI4d1VSMVpZSnhudy9PL0VSdkZWMjRO?=
 =?utf-8?B?amdxaHZ4SGNEREFBbUVRemdybzZ2bUhFQmcvclVVOTR2Zkhzd3l5dGFQcTI0?=
 =?utf-8?B?cDJmV3g0VzNFbElUV0hBUVdwcHpieUpEbmpkKzN2VHRSWWZvaWV2TnFuS0Jz?=
 =?utf-8?B?d2VjcXdIT2hCN3pOMFdrZmV4SUZIMUhwOWk0aWc1dG1MQUJCenRUTk5pVXlh?=
 =?utf-8?B?UUxiMjJ5ZWJNRGU1T2liQTcvMDV2VWZUZ2VqY1pmNStCYUFRMWViVDA0RDNw?=
 =?utf-8?B?aG9FWk1PSnM4TTVzZXdCcTREK2I5bHlHaXRaZTBTNVF3VUM0d1F6WnpiMHVp?=
 =?utf-8?B?SkdPSStxTlpqN1Jza21mUGlQVU9IYkFpSi9uQStYVlNQOWF1NTY3QXRlbmNW?=
 =?utf-8?B?Y2Qvbk5KdzNCZU1ORk55c1RMOENZcXpGakRscmxVMTh0WVB3MXgrVnBsbzB3?=
 =?utf-8?B?cW5LdWlVa2xlNXhwd0RjWXhkSm5IdEI4RUZhN2lYZDVFSlptK0dvVHRlemVL?=
 =?utf-8?B?elY2cTNkN0V0QkJ4TWhQYWhab2Qra0plcERhNTFNS1lLQTVWRVIzL3U1ZVhV?=
 =?utf-8?B?bU4ycFVxTkhzY0dMWHJKSE16YkxhRzgraldFQXhUb2puc2R3LzhIOTl1Z25i?=
 =?utf-8?B?WTRFNmVFYzVpQ21rYyszUXR6ZVZrY1VTeHN1Z1JFTjc2RGtMV1d3NW52aFdl?=
 =?utf-8?B?Q2dPWE5SbUxzZGhaOXMyM1lQNzVrWHZycUFVUFM5SmdTdmVRUkV3ZkdGOGRJ?=
 =?utf-8?B?WlhqampFTWVlNXZ4ZmVCZFRaK0R4c1FUSVVCdnFYQ0w4ck1nbkJYakJjUTFh?=
 =?utf-8?B?QUgxMStESldBNmlpR2xZL0xPTEhuakZBOFlEZzBpOVRYSkNOTFpBbFJXdm1t?=
 =?utf-8?Q?O94o0Atu9FG2SKuyab4VcGvAQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a5de95-387f-4cc9-f6e7-08db239f796a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 08:46:44.8288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kt+hM4yR/ItOP7D2JQZqyn2KUl5fEk/oyUwJYe9NQr5fBd+hvwd0Imx6a24TCVruRiFex2H0/2HRcTaXWJb6pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9844

On 13.03.2023 08:26, Christian König wrote:
> Am 13.03.23 um 08:23 schrieb Christian König:
>> Am 12.03.23 um 08:54 schrieb Huang Rui:
>>> --- a/xen/drivers/vpci/header.c
>>> +++ b/xen/drivers/vpci/header.c
>>> @@ -392,7 +392,7 @@ static void cf_check bar_write(
>>>        * Xen only cares whether the BAR is mapped into the p2m, so 
>>> allow BAR
>>>        * writes as long as the BAR is not mapped into the p2m.
>>>        */
>>> -    if ( bar->enabled )
>>> +    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & 
>>> PCI_COMMAND_MEMORY )
>>
>> Checkpath.pl gives here:
>>
>> ERROR: space prohibited after that open parenthesis '('
>> #115: FILE: xen/drivers/vpci/header.c:395:
>> +    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
> 
> But I should probably mention that I'm not 100% sure if this code base 
> uses kernel coding style!

It doesn't - see ./CODING_STYLE.

Jan

