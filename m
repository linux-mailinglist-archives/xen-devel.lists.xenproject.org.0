Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 810694B6B84
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 12:51:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273078.468136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJwMG-000741-U0; Tue, 15 Feb 2022 11:51:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273078.468136; Tue, 15 Feb 2022 11:51:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJwMG-00071f-Qs; Tue, 15 Feb 2022 11:51:00 +0000
Received: by outflank-mailman (input) for mailman id 273078;
 Tue, 15 Feb 2022 11:50:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p95L=S6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJwMF-00071Z-F4
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 11:50:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a18af28-8e55-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 12:50:58 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-YtUtqz2SNOCekyh5614uKQ-1; Tue, 15 Feb 2022 12:50:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB8962.eurprd04.prod.outlook.com (2603:10a6:20b:42d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.19; Tue, 15 Feb
 2022 11:50:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Tue, 15 Feb 2022
 11:50:54 +0000
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
X-Inumbo-ID: 8a18af28-8e55-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644925858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t3j3LjBOIjJKgkBeEafZZ+4j10yND+CJiSEmZBQ8QXo=;
	b=DaGhEHyodqsskCnMDZWSO5N04m3oIh0lYdzqLcuHIAP6crf+FsaYlABjPY7RUkoRSRZSys
	+257/Zg3namU5cOQRGGwBguEw8FqO1z7H0UNmV2WHQD44NtYWAvT/mGpSBQ/aVaY1ITt0q
	EBNe7PqcEZy1DKBVN4/2M2ZzD1TL+68=
X-MC-Unique: YtUtqz2SNOCekyh5614uKQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AILOX5iGFArmQMgl91pGxkL2cxF2ZPh0IPU06RcUjXDfWBRJqe4eN1OKsu34OuGxK8a4r4kSO9fCZv6TzZf2lpPi0QqBChfSNcMuQKaOwhY1KdfvK8r/G2CuDEkvHkk1H4WXxmWoBnS3ZvPClgbux8B1ppQllUpen9YkP4PCfgrfubJObl5exGrjRyagCIFDbp3EOhNYeZVJ38yNWi//vQHoPVtfMAhYKZp0Cao2G/n9DLgWlC3DhMxjnZM0Wa3relsqC5uAeYinK0AABXK5SDmFNEp94Bp/+LmQyDwvBsUk3xy6vUTl1LRSJKmX0zPKgqYpI4VtX5EhuPXgKR9WjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t3j3LjBOIjJKgkBeEafZZ+4j10yND+CJiSEmZBQ8QXo=;
 b=nTfItv+PUG9gmBoaK/rp1MFz7bOdOvzuuwSt2PfQbS5fH3m7nhHdTNabSOLoz2NKK2ZnGBBy6o5F/sSMRhCdxvpRl/bUlmsr0XD4Lt8fVn8sMm1yJiRza4+qmqiAqJ5yyvpKMf+ztJ8QKLPVPtZ7RBxocPv1b7t4GjfvXE3qLSYkZhOKS/frmvzNlOttQmZyrwS4ME3GhlQUMQdi7QEyyxkyGGEZzaPPkgIdz6QVG2i10wglHBW7PXqcvuPldVj1enlqEC0u9mmUvUiJrbpXsd2CICAyPI+SBnJ6jGPNDJ5+49I8/qJKE7mON3rH+LFvCcM0WH6Ua7j+uzw1r1vPzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0d8f01b2-b015-a08e-dd49-e9c688ff7245@suse.com>
Date: Tue, 15 Feb 2022 12:50:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2] vpci: introduce per-domain lock to protect vpci
 structure
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20220215081135.1497470-1-andr2000@gmail.com>
 <YguE7RWOteSnvVNY@Air-de-Roger>
 <c5b9b02c-93f8-d018-6048-9abf2e7de4dc@epam.com>
 <YguQ8wfhfYFXTWSU@Air-de-Roger>
 <70dbd7fd-3f74-d0d3-6e30-c1e1e24fc279@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <70dbd7fd-3f74-d0d3-6e30-c1e1e24fc279@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0502CA0046.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8713544-45d9-45a3-ec8d-08d9f0796c44
X-MS-TrafficTypeDiagnostic: AS8PR04MB8962:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB8962E5BFC1B54B8ED0AA7594B3349@AS8PR04MB8962.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KzQmelbj/gxdlxeOy1JCsy3+FT0hYA13EM2CYh9XldJq6+bVBqql7PwZV3NTxF1Ppn0lBnHMzKjZxxsKZrl8ifqCeBe7dIhVmSZYGuowZNiAjjjBn+V/mWkjQmc9OiP0J/VU6giPlLvFlkBtUAnYuYo/ZIxb0vHGwovGW6YDGRUsJ+SUGWlY/u3yOLSAE3I3zORqpjCJQ4tP6+o5cpE20uEnJMq/kAh4SPpou6UCU45WaasrN5PQzK3WeuSaBV8uJDczP079wx+4EqRxvIyuFD6oZ+EAZvS9B6sOF43gxT+xHAJNC4hUh35Cww/jCvnWkxl/54IqXIRHrD5KDDhunYpVvvPWdIhuOZJKJsFVcigTapCFCB/mPT99FUicV3bhGuQUOp638HZy7BJn19lnszJAg0PpawR0f8jLT4LUQmW4K4o5JcoGqgbhkgq1ATIXn4hXHXjxZFrBaRfEQ6xhmzsk0jY5UMg4jJZsZUadnLQiU7ExZ/ljs6JOkcQC9/L9cJexwXq81tUwXhLnrUcT47J7h4noE7HVVIKdoGBYGvO4GPVokol7Ak7rML00fc8iGLr4qlbTSfP6a7rEETQOkcId//7/ysHsu+0IP9Psyvt/Q8o9w8InDhtaRAlkByF30v0mDxXgnUE0zuB3jnTB6sPPiIYpebBdbmkM9ZGx8Y8octSTmz7+EymmXlGYbqzUwduC7AkMIkiLnwX7Ew94TPX1M/bpuAnWwrsePE4XbcU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(83380400001)(36756003)(31686004)(186003)(2616005)(7416002)(5660300002)(26005)(6512007)(53546011)(6506007)(6486002)(508600001)(66476007)(8676002)(316002)(66556008)(6916009)(31696002)(54906003)(4326008)(4744005)(86362001)(2906002)(66946007)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUVaN21WRlFJTzJWRlJOTWxmYUtGOTdySVdDU24zS2ZMRE93UklwZHFqdHg4?=
 =?utf-8?B?Q2FXdlhWcmwySW5UY3Ziazk1cjh1WURjQmJXVk9mRXpxUWt3dzJxNzdSOCs1?=
 =?utf-8?B?SitpaXZKajN3eGhremNaeUpjV0cyR2R2UVI5MUtmMGhoZHAyeDgrT09jbmIw?=
 =?utf-8?B?VmoreHpaV0xDYVp1WXprbkpkM3ZzOUp3OHFnZVg5Uzh1VzIxVTByYjFPdDFG?=
 =?utf-8?B?d3o1bjVEVjQ5MjZNNmtGa2l1bFMrLzVJVTZTY1hSeGswQXFINUhNTzI1WVB0?=
 =?utf-8?B?dzhKSzN6VTF1NWJ2RFd0WDlPYmt5OG5sdXVWSklnNTVsSlNDZnpJQmtJa3dE?=
 =?utf-8?B?dnI4bEdNV094THF1ay8xL1g4b1NteWJCRDdNWmZBQlpLN0RoZ2pQdElIdHZQ?=
 =?utf-8?B?WVM5RENFL0FJY0NGQVFrZzVBTzNOMFYwUlhVTWJ4MHlzeDlvRDZSNWE2MFVT?=
 =?utf-8?B?UnV1RzBwWjVNMXdIWVEwekNPcVVHc0s2anpBbWk2c3pNMVN1emx1d3RUK1BG?=
 =?utf-8?B?V0xrelVIOHQ1Ukl1bkxiMUUzM0ZWd1BDa3NYaTFTRkN5U2EyYzgxZE96d0dJ?=
 =?utf-8?B?QndZOW41amVHTUh1TUFaSkhVWW80TWxRV1BxNzNwL0puS3BuUVF6ZTIvdFhX?=
 =?utf-8?B?KzhJSlNMeUhRNWdncm9RMU5HdFhnd1hEU1RMSFc5WXJEY2FNRUZFM1loWFNU?=
 =?utf-8?B?eHpSZjl0a1hTcVE3Mi9ldnNwWjJQNnZMNnU5L3l1VlB0UkpuSlJDclV1clVH?=
 =?utf-8?B?QTRMbStKS2VVY0t0QVJWY0llRGl4cGh3OC9PRFB2azFyQWJ0M2wxZGVuZ2hZ?=
 =?utf-8?B?WUFCd2YvL2ZtK1g1VklXU0Y4enNXR1hSby95Z3dNUVlFUHFFVmhEdEFqd1Fk?=
 =?utf-8?B?WXBPU0JQR1MrUG5zYmwzaWlESVJueG4zRlZRSklXVnJFVHZrMEtDUmg4QVJZ?=
 =?utf-8?B?aWRDa1k0c0tWaG5mcHJYbWpLbW0rM1prUFNaQU5ESEd2eGg4eEYxVGxNZ01M?=
 =?utf-8?B?VHBOdmRCZUR2ZlgyaGJyQ0JodldHdkNoNkd1aG8vbnJFMnhrSTZtTW81VzM1?=
 =?utf-8?B?eUtmSUxOQzU5Y29yd2VQZ2NpTGE0UWhMVVF2b1FpZ20zcWRReVdaa25XTWNT?=
 =?utf-8?B?N1NxMmszMWJHNENSUHh1ckRtWCt4OGxsdVlBdkUwZDhXYWJNYmFkVk5sVmds?=
 =?utf-8?B?elUzZFF0UlJyaXZWZEVuUW54RG5zc2srMVkveFBFWUN3OUdxQk1rTXlyV1lo?=
 =?utf-8?B?dHJtZ3c3NnJPNnFodEVmR2U4ZU4vU0x4TWIyT1ExdktNQWhTTTV4QUZXSW1h?=
 =?utf-8?B?Y1BmVE90SUZKMy9BSGJRdXluenB3QnNlSTJwYXl6Qm5lR0NXZU9WUE44R0FF?=
 =?utf-8?B?aTVsaTZzTDdweFVtSXR0WmJTVnZJNmJPcnFkNzVScWRoL3E0UE8zTlJJMkZD?=
 =?utf-8?B?UGY2ajZBS3R6eStzSmErbmwraWVqd1JGWmZ5cS9VZDIxY2ppTzZtck1TTHA2?=
 =?utf-8?B?VXN0R1M3eW1mRWFUUWdsVmt0MXZyVWhwSml4VFNWNlU5eTRVeHFDclpmemg2?=
 =?utf-8?B?QWs1dUVielFkT2lPT2hKZy9lMnQrUHptZmV6ZGVveWxqSTJuRUJXY3RkRWo1?=
 =?utf-8?B?U3BHVzQ4TzBkSXRiM0VEc0hqVHhwdlYyVmozQ3NrNU5PN0IxU0RPaXpldHRW?=
 =?utf-8?B?anBPSlhGdjZIdUFLaXZTZWUwYmZSTjJRaGppL0FOdjcvSkpJVGU2cU1ueTM5?=
 =?utf-8?B?QnJVTFpQMVlvbGs3Q1ZmZDBQdWlKeENJVG54QVFKSHBLQ0JLWjJITVBhWm1m?=
 =?utf-8?B?OWU2Vk14aXlxdkFvRmNZV0lKTWZOWkNVcGR4VVVVbHRSaWUxL1lBMEIxODlw?=
 =?utf-8?B?bWh5emlTYk9nYVZJN2k2NnBhMmoyWWJlUXlFOXg2YkhqMHN1ajNzdENrekxn?=
 =?utf-8?B?TUQ2eDU5andHZkJ0T29ObmV4Mi9Ha3g0aG04cUpqbzI4NndOTzRPUGdsTWor?=
 =?utf-8?B?K0NqK2pmWnZ2eVJqdk5zVHlGV2RNcjFyTWw0TW43NG9kNEs4ZEM2QnlOS3hm?=
 =?utf-8?B?TUQ2cDZlY2dTYzQvbUZrWjBJSHROSEtYdVRzd1Z3OVlSZWhLS1BrSVo4SlZY?=
 =?utf-8?B?T0dTYnpYQjlPUTNrQjVnS2dPMTNLazc3cUJPNlgwTDhnVVdGanpHK2JMemNL?=
 =?utf-8?Q?oktipJ7ql5EjpbPFMXa7dpA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8713544-45d9-45a3-ec8d-08d9f0796c44
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 11:50:54.9207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1BtGzbxdtjkRqA1wnpc7eeJ8z2vgRnUX7lTUJsfWbvB1/mf3pvxvFZB+58afGGNQDcoB3kGNeME30J+wEtIrvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8962

On 15.02.2022 12:45, Oleksandr Andrushchenko wrote:
> I'm on your side, I just want to hear that we all agree pcidevs
> needs to be converted into rwlock according with the plan you
> suggested and at least now it seems to be an acceptable solution.

I'd like to express worries though about the conversion of this
recursive lock into an r/w one.

Jan


