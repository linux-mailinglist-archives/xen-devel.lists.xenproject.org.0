Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1878634940E
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 15:30:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101408.193957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPQzW-0007dm-C6; Thu, 25 Mar 2021 14:29:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101408.193957; Thu, 25 Mar 2021 14:29:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPQzW-0007dN-8R; Thu, 25 Mar 2021 14:29:42 +0000
Received: by outflank-mailman (input) for mailman id 101408;
 Thu, 25 Mar 2021 14:29:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gSM8=IX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lPQzT-0007dI-Sp
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 14:29:40 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3d8fb3d-0e3b-4dc8-a225-fbcfa01ea3c7;
 Thu, 25 Mar 2021 14:29:38 +0000 (UTC)
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
X-Inumbo-ID: f3d8fb3d-0e3b-4dc8-a225-fbcfa01ea3c7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616682578;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cLFWo8v+9XmjouhJ0WzdR82KwgECDTWixOVz/Dd37vg=;
  b=SBOubSvPcAxTQ92pLHSI0qziS/jLHDyrhaPF560iWX+GvVJrQ+zlmKKL
   9lWgwzdQGGCSwj0kZMXD8bUDZitJJzdf5cWfaQpcBdmhG/iB2wii1cPNY
   0YcUC28W9AikeRaEnNVR2CLhPW5/cSmWoKUIIUBijxxeF665DmX5bjam7
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: vCA057jv1l5U4u9s0Wue45GWoSQ2i4pHkUVVsPNtvUQQeYmvxW2KfDGO40OMLttlnTe0VDbwI5
 H64PoPJLJnFrxxangIvr1nVfV+PF2Pk84gn3Dm/Cf/gcQbfo1A62RWouZOru3TwnNk7lcrKvHi
 W9qLvmWFveUBjwvOgXm+nJrDBFrUvdjEILBtWXT9BF42NwTkR8sBEbbPDcMbsptCleZn2/EobT
 H/nYsMqC8X4QmIrZv9hjy32F/AUWAHkODtQJ0awPNIBd+N+RovhUlJR2APrhDyTH3kHJRUSl5+
 hw4=
X-SBRS: 5.2
X-MesageID: 40007088
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:OFJC2qmPocpqnoq8cWgosZTuJw3pDfP2imdD5ilNYBxZY6Wkvu
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/NIyKMWOqqvWxSjhXuwIOhZnO7f6hDDOwm7zO5S0q
 98b7NzYeebMXFWhdv3iTPWL/8O29+CmZrHuc7771NACT5ncLth6QARMHf4LmRTSBNdDZQ0UL
 qwj/AmmxOadX4abtu2CxA+NoCum/TxmI/7ehlDPhY76WC15g+A0qLwEBSTw34lIlBy6IolmF
 KlryXJop+Nntv+4R/a2m/V4f1t6aHc4+oGPuOgoIw4Lj3tjyyheYhuXaaT1QpF3d2H2RIRv/
 Tn5zsmIsRv+1PdF1vF3SfF6k3b/xsFr1/k1FOCjnPoraXCNU0HIvsEv611WF/9ySMbzbVB+Z
 MO5U21nd5rKCmFuyLH693BR3hR5zKJiEtnq8E/pThiS4cEAYUhyrA3zQduP7orOjn104wjGP
 kGNrCm2N9mNWmXaH3UpQBUsbqRd0V2Gh+HR34LsdCO3w5Xm2hkz1AZyNZ3pAZ4yK4A
X-IronPort-AV: E=Sophos;i="5.81,277,1610427600"; 
   d="scan'208";a="40007088"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xm2DjEOtrF59Y5Y6/42VHaEzsmTTPZBr4lZmo9HupDmVfp+ooxcZfa7yWshlFgXomuTxj07wpvKYxYcT+7gJRB+ez0QN0Xe3OI18SOXldsBeXkxepf9VOeQkUxd0nGZ3eJApogBtS3Fd9RJDSv6n76BmA0YEeJV+sHwGMW01FffdZLup2BHHsC0gKDIcaI3eAA2W+0LxzIkyZbelLk4Tdt3Xg74eoE6MohvnYciKNPr7W19s4mFFJgxEfE8yxFu+hdmJF6lsqiuhYu5UeTWj6sZNxvqCmKG/tluixfa30GFNqpmWSYHxz7bdBrKnbn4gL9biWyHakTfHVcNK2ZMmmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLFWo8v+9XmjouhJ0WzdR82KwgECDTWixOVz/Dd37vg=;
 b=cqtvyHNd/DYYmoUE2S2mysBzrEkE6Rm0tYTMFRhaC94xgYVqJAD7ENWKus8iI2fngdmPcS+quSkU0HNYUu6GB9oVi7rGKKj43lMB1S6zvY3t5Mc2eR5+GqkNLk9GYUvC2i95E5i7soNXXjqFsq+/c/yT1EpT4qDzJSmh1n7uMuQaX6PdkFOGVzCAUvH9aZ/rQJNseKMndheNaNZoKC8WTQEfi4C7vvJfrLHY4wV+gU9kH2yokvy15JIA8EahcFSAN5IhbjYfF89rz8F/eFK/h0oQqjshOVWIXrNcyxqhyLPa9T9jF88WSckTmQjI3dCiB+aO7xNX1AIVWPCRO3Qd7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLFWo8v+9XmjouhJ0WzdR82KwgECDTWixOVz/Dd37vg=;
 b=uHHzNglrIEXIxhqhuV2DT/ea0SvLa1QZXeXH6lIu3Co98duvnituxX7UfEfQMouKDaEgvGCDMZmbN7UCrQZ7be3q5XPdSeVHpPoga0fOAVoE/QCpurJptGlNSO9MNNvlMZPAz6WYjJldYY05YP+W+jBdM4e4SxdiQDnLIxn0CPc=
Subject: Re: [PATCH] tools/xenstored: Remove unnecessary define
 XC_WANT_COMPAT_MAP_FOREIGN_API
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
References: <20210325114243.12284-1-julien@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <7c3123e2-9dd3-b808-80c5-a13c5f1cc51a@citrix.com>
Date: Thu, 25 Mar 2021 14:29:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210325114243.12284-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0320.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::20) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63f259ce-12d5-4aa6-42b5-08d8ef9a6959
X-MS-TrafficTypeDiagnostic: BN6PR03MB2580:
X-Microsoft-Antispam-PRVS: <BN6PR03MB258075DA33C162B9F83E9DAFBA629@BN6PR03MB2580.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +gy+47gVdT+gxq+fO9YENU+gdI5+tAzeEshEmjuwDcZBv7/BTSWiWdMZU3jSak1r/FO3IKng53Ux7VBZ5HQd6q5AxdTsYXryETMDveIn1FtSRMkesNCA9hcItftvDpTM1nm+UEdHQgBAQdg8CPuy/6uRU2ivLuvC9DtVh/73qt+VoWGsZ7F2FfX6efkjIRxmAoF9bSPdDdpNGDZWBk+cXXIZHcQFc+jI4dD7SjTGCPYlgX4NgAxhcI8ToaH0RbHpOQDhQh8AO5m6E58i+TzblN+8Ijj275pmPuRkx4mNLiKJMB0XGyE0fr81OWzn+U+0+1WtRGyEs5Ke/D+YQFecY6rXqfrzv/+kuZY30dZPlrksSPlvOfB0RDdWxLcO0MR0XurMmSW9jwAQjH9tRHYhZpBaLSosYKkKjY57gkLtF03pZxmj+7N7YldICTTho9j5QpjpEI5dWei3cohMlC0l2k0nl6kZhQYoMI8eyEX6gbHJobHpiSXR06ZC6tPG8LxHQkxoZuXRTUE+j9YmZcA1EgDWSuwBOqZjVXCc2otn/wSy4SnQ02CedqKALMmAthfnHy+7HqkSut+43Liprhzkyjz/dm0pOK0StJlTOTCGya0dN0biyh0HysKNTK+aZ6BHUBku9xrsqbCnMeUK1oyfyR7DMJs/6k8z9GLUd/d8CB3qKq/qrUMqDJT9LibQDO/Aeqq5ltq83FSzWHuD7Zpn/JZV48B+Krzw6/UiKUQp4xw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(31686004)(5660300002)(38100700001)(2906002)(4744005)(53546011)(956004)(6486002)(2616005)(316002)(478600001)(16576012)(8936002)(8676002)(66556008)(86362001)(31696002)(4326008)(26005)(16526019)(36756003)(54906003)(66946007)(66476007)(6666004)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WWVrOEY5SjVQRmtQMlEycUMzN09BRjdGY3ZMN3N0RnBqTnBrNnkxSlArRzNn?=
 =?utf-8?B?eVh3NEZKZXRGQU85MWdZQTh3cUgrcEZaRlNQK0lwbkhQZS9WVEJReXd6OWhQ?=
 =?utf-8?B?N2FvQUNFNngrY0RRVjdBaUhZWHZZekxjYzlkNmF5NWl6UGZiLzZpTFYybHRz?=
 =?utf-8?B?U3dFUGJHZm9RUWQ0QStCSDR4Q21iWGxhclpONExmVjRCanlUYlZQcjByV3k5?=
 =?utf-8?B?OWZXYzBwSXVEV1hhY252QkRiOUlmYmxqOEtUN2xYYk4xNFduc1l4VWVDU2Rw?=
 =?utf-8?B?VWswN09SdnE4dWhWN01KMkFwTDhvWTJtN1hXbFMyUzNZbEh0b1Z1VVRuQjZN?=
 =?utf-8?B?NXdVWkhxYVVRWmRuaURWV2tmQ0pKL2xGbkM1OElua0JWV0ZHd29iMlBZd3VY?=
 =?utf-8?B?VWFjcW9XVGo0K3ZkZFNRRzlIUFBVTDFrMFljUE1NQlhzZ3pjZzJkSFpYS0NN?=
 =?utf-8?B?d0pBaFNKZ1VwcUlPKzR1VVNEUkVtSVYxRDVNQmJ5dVZ1RHNPQk9CUjVRY0tm?=
 =?utf-8?B?WU1ZeXZiSjd6cHFKdlZtbkRhZlJmK2Myenlsc3AzOUFxdU84S05VN0FZZThK?=
 =?utf-8?B?VDVmYWpQRTdCWkIvdDNBdWprYkQ4WUdzTVVVL1NpWVFsYng3bG0wSWlDZHRG?=
 =?utf-8?B?Z0dhWXhzWjRXL0U5VU1wSUlCOW9Rcm1YYTcweXNzbWRnYTQ0Ylc2Nk80ekJW?=
 =?utf-8?B?dkh6MjV6Q3FGc2FUdVh2Z0RCdS9pVVBoRWpDYTNwUlMvSjBGcmR6UmUza0xE?=
 =?utf-8?B?UDE4YVJPV3ZQT3hMMmpZdkFzd2tsU0pwSUZ3b3BpSzd6UkcwK1FUczg1Qm1S?=
 =?utf-8?B?ZTJhWWFWQnRPNlFKeHNhdFNTcmdnTExJMFZBUm1DRGZZak45SW9sdWFmRTNP?=
 =?utf-8?B?dGsyV3lHL0IrT2V4NTZ4WVRiSlRCNk5jNVVvQXdtcCs2b0FtcGoxVUpuRjVG?=
 =?utf-8?B?a21iaWJveG9TcTRiMko1cGZpNGlWKzl3NURjOGZRUm04Z2p6QmJVT1FGdGhC?=
 =?utf-8?B?MDh2K0dKK2lkSml5R0dhdllRakNPa2VxMkcveDVrL0sxNE1yeE4reU9kdHd2?=
 =?utf-8?B?YjFma2VkZU44eEJwRUFxR3RxVFRLeTU3RjdlTzJUcktPUUhzSFN4S0VTbDlX?=
 =?utf-8?B?R3JvQmxmaHIvMVExSFdqSUprdnFmNURXRjMrc1BvQjJPVnc1Mmw3Y3hBVnJU?=
 =?utf-8?B?R2xmN255NjlXS2dMSFk3ckJRNmRhVjFrTnNITXg0WmJuT0prZm8zZ3dCSFlK?=
 =?utf-8?B?a3E5MVo4SWVTWEhqK2plU1I4dlp3cTlFNndFVjN0THQvdXRYYlJCKzdKL3ZQ?=
 =?utf-8?B?Mkh2a3QrWFRBc004ZUFOa1pjNjVQNy9RdVlmWHR5bHM2dFJvN2lSdW5IWlpW?=
 =?utf-8?B?b3BZZ2pnZVdZdnd5ejI5OEt0cFpManEvUTRtRDZHRjNlN0N3a2NBRmpUVjVp?=
 =?utf-8?B?ZGswZVRiL2RSbXlxbWNCRFphdm5TM084dlNwQjFsMVg5Vnkwc2VYcERNZHoy?=
 =?utf-8?B?blRxQlpXSzRiczRtS3FETDQwOWRnUU4rb1pVKzBlQzlGb0dhUitwNVhzTnRX?=
 =?utf-8?B?RVR0blNKeFpNNnp3cDhCbFlrMUsxeFVlaGkrZHZyUXVHOFhweDhOdG0xOWFH?=
 =?utf-8?B?S1lnVDJtMVRHUW82TkEwMHEwQ1pIUWd1NWhkZjNoTE0zemZhaXBTdlR0aEwv?=
 =?utf-8?B?NlhuYUNkaExNZkhDcGZJVmdvYUU2VjdVcmZwcllFVG1OaWtDRkVKMThnUnk2?=
 =?utf-8?Q?lFfQx01tpTLIjpuR27VPbjwuYGqnljthp6Hldqp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63f259ce-12d5-4aa6-42b5-08d8ef9a6959
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 14:29:34.7033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rObLEV21j5fdqzzlj2keE8mEcl/gvVJLjYHQ4aHQYZSeaet3fGjx7dVk/JEa234opqPVybMQ4+Vo1VCBIcGpvkGNToH0hG7F0gMcQCL/lqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2580
X-OriginatorOrg: citrix.com

On 25/03/2021 11:42, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
>
> The last use of the compat foreign API was dropped in commit
> 38eeb3864de4 "tools/xenstored: Drop mapping of the ring via foreign
> map".
>
> Therefore, we don't need to define XC_WANT_COMPAT_MAP_FOREIGN_API.
>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Oops sorry.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

