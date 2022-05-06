Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C613951D993
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 15:47:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323173.544789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmyIQ-0008U8-P5; Fri, 06 May 2022 13:47:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323173.544789; Fri, 06 May 2022 13:47:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmyIQ-0008RP-LH; Fri, 06 May 2022 13:47:02 +0000
Received: by outflank-mailman (input) for mailman id 323173;
 Fri, 06 May 2022 13:47:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmyIP-0008A6-JC
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 13:47:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe99ec6e-cd42-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 15:46:56 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-_QqnlWJvNSGsYLkoLUtsQA-1; Fri, 06 May 2022 15:46:57 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR0402MB3911.eurprd04.prod.outlook.com (2603:10a6:209:1c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Fri, 6 May
 2022 13:46:49 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c%6]) with mapi id 15.20.5227.018; Fri, 6 May 2022
 13:46:49 +0000
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
X-Inumbo-ID: fe99ec6e-cd42-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651844820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rRZMAgT/r95Dn4OiUM99nO9GHGmOz0xsBpQbOtmT7cc=;
	b=jR01wx3t2ysWsmS2L02FQTEMcF2QxCXLMLrvmY5w3l+rwlqj+oNebLbUn9qingB4/QIWUO
	EeMBLGRo0SsINnP6KcYQ+bWJkPB3mebNI4xGVcv2YIiCtASkSagUwW4vEjAmIYnw98DsAE
	c9WWhFJ9gpa4Ecx3v/HMp4XxjeXjUK4=
X-MC-Unique: _QqnlWJvNSGsYLkoLUtsQA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ArpHw1dbewj5FdOyefUHEa8OEr0A3zGcqPcii1EQJCoEiFApT+tCMgtEDkzHK8Nxz1KLsyCBzRxVsjYQhpBt/1/DYXTqVqeT10CgM+ctaLfS7xljgzf9EG8dJFq0C2FZBiei/BpesvqypjvwW3WC+Ue4Iiu5KMN6AFVMD9uvF6LUrH302Uaxt/IKqGCvvk0wfFvIob/VBx1f35ere5/KTxkqQYpktcFf4sy9pvJXKf1HjEznfjpe0Qq35KqltavbqJKxcbHO6UGn6LS0jiypCzwWiWxFQpmydLDaElfBQ2bKtaKe+GtgcwcP9QTiJK73UjARRMVuUsd2pthNitZg9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRZMAgT/r95Dn4OiUM99nO9GHGmOz0xsBpQbOtmT7cc=;
 b=WIsc3FhJeBdajQ+/7LnuXR1GDfSjUq6OTH6uEowJ4fxODntPNwHhC54KlGRQU4knNKmD2tb9bmFlPz176j6E31U3gHlwElW2rSvHwO1VwXWd+dvDnmEnu7+FxmP/Bs+HeGO/f1+1OwdDvqa5TPtljRavIOFenA904FVCjeRXhizK1t7uJunOVvoOk6oMwozAlfap6N8XOf05wxdemOPs9p5jO6oBVignHDaZ+IgGEc67ui8SmtQlNloYRHlI8aF2ICc+IY3zOoMahtSX01333f0dNj6Lrw7z5bUJQYdQMtBxL+GdXZmQjL5+z2XZ6nU31cJIZXJoGLSzsse5opTHGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b997ae88-d86a-361a-a19b-1ad70571ca5e@suse.com>
Date: Fri, 6 May 2022 15:46:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/2] build: silence future GNU ld warning about executable
 stacks
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b3e9750f-4dd6-342e-b550-21bec8da49e6@suse.com>
 <1905d86c-6363-c6b0-97b3-beb91aca9055@suse.com>
 <20ab3107-a548-450c-0c2c-98be53f6270b@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20ab3107-a548-450c-0c2c-98be53f6270b@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0044.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::21) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0b21dc6-8221-4ec4-af13-08da2f66de9d
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3911:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR0402MB3911C5734FC7556060ED1BE6B3C59@AM6PR0402MB3911.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IdjDTSMO8NVrp2SBDKb4gK5iWwtnquhNhTpCYh/LTaFsp2j7eS+dn83cbsOime4y48VXNqJasSQCobiBjCqrZp3TYdhpb7daPXRoJPTZ4q9vUG7CRh8AhMNmAGbw6BAO6Mq3HBHxzXORyClDOxbx0rrAzrihzN0BaxeBX4JJVK2yZr46eriJ+kmuwj9zP388v7SnJM+nMnagTX19cUxdlR9S0I8qoOeDjqmRRxI8YLjMeFzu5Ncgfsxpbg+Tut0Qq6sPO4Jb/UhE3D/qdP9/osukHAOYnGNSASpMhNYO+T+NEDq4R5SC9VK2zHMOYcw+wWAU5lZMkqx+Nfd2aJzUtpPpWRf4V4ITbVfqBHyoBDISn2tuSem/wb5AFwf4eRfbyiWzx3uuzcp+h/72ATAnzjw+7StrYQQgegc/DWlAMgwMc9Vbcp7tGIieZiYz3VmCGcK7QPITmPNoQEI6KJoBwSfDYfzLNcFCqPg/Nrgcl/E0CsVw1hRPyANaqbymW0STHs0EmCMMITv39cHVUQm5YDAI2Trbbmg1WbJlo/P40L3jwiYnIIVDKdxlLeqzjOr2/UbWo56x7CzrQFvvncJCHU4Hci0zoBy5Y5CkrRBBP2XItcMbsGK+ekRg70v7wZHIpLZR5HwWHCsYJrInRivbs8ZYBZ9/+PYBvm6Q2X9FNmHzVpETTu9qfo+4mNeS0Pzz9THkUUBABoK+OTIdasYL8LqN6IFZjr2I1i155kFxHuFy4a+PWn0l1XeXxmlUpB9V
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(66556008)(8936002)(66476007)(31696002)(86362001)(4326008)(4744005)(5660300002)(2906002)(38100700002)(53546011)(26005)(54906003)(6916009)(2616005)(508600001)(6486002)(6506007)(6512007)(316002)(186003)(36756003)(31686004)(83380400001)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzJpWFNyVlo5QzY1N2dFeGZLaElnVGhkeEhRZ3FIUHJXRVM0STNZYlNPMHNS?=
 =?utf-8?B?OHo0RUdxTHN4VFZRUEc3NTN0d3h1ejlFZGN5M2JCUkJNbHh4VGpwMXIzbHNz?=
 =?utf-8?B?UUNha1BUZVM5eHZUTG1LZTlpM3BRYjJVMjFCTWJMKzRKbW9hSVdmM3RaRy9m?=
 =?utf-8?B?QWFGclBUSGJheFU5YzdOeTNsOHMyNHVkRWxzRFJxNlRua3NDNkF3Uld3bmEw?=
 =?utf-8?B?R2dNbURyc2FyL2tMcElPLzRPYmdvRVVCaDFpQkhFOFNVamNBc2VYM3ZZL0ZP?=
 =?utf-8?B?bUJMcHlMcVdpeUpSNzA2Z3k4VGM0ZUMzYlhnd1Bxems0cVppTTB5Q2dGd2hm?=
 =?utf-8?B?Q1E1M1AxR3JjeVhsOUhHWUpGS3ZHUDdFZzc2RTZVNHJYMW1TVDcvTXVVSTRz?=
 =?utf-8?B?MFg0R2hsZ1BMUXBSMnArSE0xdTFZN09wek5uWTFyeE5sa1p2RTYxS2pJSy91?=
 =?utf-8?B?VVVHWWVaWVRWcUllZ05oZFl5Q2NTelp0RWFWdGtsTktuTURaQjk1VkhzZkVL?=
 =?utf-8?B?Q3UwZEVlYUY2VkZPbGNZLy9wa0xGQXZuYU00NU9zcDJOdzFuY2duRTVybThl?=
 =?utf-8?B?cjRGMGtTK0h0a0krd1JRdVUyUHNLVFFJNm9RZnh1RUdZUDZCQzJHcFprQUxW?=
 =?utf-8?B?SC9ja0o1UVZyR0lkcDQrYXQ5V2FQVjc5bjc1a1RLZ3gzUWppV2wzNy84WWh1?=
 =?utf-8?B?MmJrNXBkTW9JQ1pSSkYzSC9lUFo2YWpVeEFtdktmTytUTUxTSUd3Z3E0ZDdU?=
 =?utf-8?B?OUdyb1RWeWtiMmN2aGpDSUxxTG5iTi9ZeVBYUWxGbHhocjE3aHB0VEVONzIx?=
 =?utf-8?B?OWtUSTVMVnFNNnJnd2hOOFZ2YjkvU3B0L3JKWHJmSkEyeXFNUk5ZZHpDbmxQ?=
 =?utf-8?B?K1diRXB4cmxIME1FWU93dWRUejdja2s1ZWMvN1JYY1NmMGNZVWxxcXN5Q0tx?=
 =?utf-8?B?dXhmOFQveDNNQXpBaG8rMTZMMUVrd3plbGhJUEhYbVlZRWpTYVg2alMydzM5?=
 =?utf-8?B?bElTcEQyQ1FmQlM2ZStFa1lZK1VHREJHV0d3Um5kbnB6VXZabm51NEtLOHcz?=
 =?utf-8?B?aWtRRjJpUjAvMEVzS2J4ZWYyVGJ6a3lQUTBrc0ErdXh4U2JKL2M3SjlvQlp3?=
 =?utf-8?B?YWxHN3A0ZVVWWVlBTXRXQWVTSHZWVFJLNXkwd3dGRlNHUjZYUzJidlE0WmtZ?=
 =?utf-8?B?MGRxNUFHM0FiaFg1Y0RBSTRuZkt6RUJHbDU3M2pZaHZUeXJKcW15eXhrVXBN?=
 =?utf-8?B?UTlQRVUwVGpmYmR1SzFxM2RhNVR0RlBjQUMwNVQ2eitvN3c0NDRsUnFWc2pL?=
 =?utf-8?B?ZnZMbWxOSm1pK21FMithVEpBckRuc1dmQ1EwY1RMWnI5Sm52dU93VWE3T1BZ?=
 =?utf-8?B?QWNmWFI0d2k3MzNpODFmR21rV1BUMVFrdkRJVGVLbFJMK3U3dmdhdWgrc0tD?=
 =?utf-8?B?VGk0WHVWVE9DRGFFZmRqbU5KMDVWS3B6d2ZDLzJzOUN1b0lDbG5ROTFNa0Vt?=
 =?utf-8?B?emwzbXhQTXZ2UFJyYjliTjZjVUNyVU9IV2ZlTTBsNVJHVlhFL0FXcVV1clh1?=
 =?utf-8?B?SlBnMlZ4U2xtT3RBRU8zTWU4NWpsOC9rM2o2WnVYZHN4cXkzZElXWVU2MnV0?=
 =?utf-8?B?N0gwY0wyT0JRMTZvYVZaVGZxWS9oYmxrb1ZBZ005NzUvclZzNzg5VGpEck9t?=
 =?utf-8?B?Mm5jSXFVdEFob1pxWTdUM0o2MlhpRHdNNE05WUI0bnQwWnJ3YTZmSDQxdndS?=
 =?utf-8?B?alZUZ1lIdW5vMWRkaFQ5N21UYnJ0NHdBL3U2cjR3VzQ5eFd4a2Q5eldLdkhD?=
 =?utf-8?B?VWZZSE1WQVJBMnZ3OXRTd1VpMy90TitJV2NsdHpzRE5zc0p6NHMvTCtGY0hD?=
 =?utf-8?B?WmhiVU5uclBGcmlwREFuQ3daY0hNUDNPK1Z4R3haOUMzT2U1VWcyQytoZitT?=
 =?utf-8?B?eWd6TllkZGlvQkh3YlRUUDR3SUNZa0JsbWFkTGF0cmNxREtXc1BaME5JNjRD?=
 =?utf-8?B?Rytra0tUN3JnOTNxcGFUMmRPVnlXdWU5VURQZkVjRkFEQjA5RTVqbzZnZlpV?=
 =?utf-8?B?dW1ZR2xGblRCYzd4eDNVaTZkVDFLOGhsNGpkelJOTUN1Ui9YYkgveTNnaWFv?=
 =?utf-8?B?YjFEdWdQczc3ZWMvWTFpUWpoRTE2bVkwV2lUZlJSRm8vYTN5Wmk0RTJuZFh4?=
 =?utf-8?B?cFptR083UWZUMzZNTDdXS3VaQWNOOGVzN2dOVHNaZ2RTallIdkdUT0xYam9L?=
 =?utf-8?B?Z3hkNUowMEdHUlQ1T0x3OVBZUi85TElTaVlkOGVkUXJzYzcwRStpK2xvQm5X?=
 =?utf-8?B?c1NtUnBCamF5SVF0NzBrb05ZQWJxRGJ4bVZWVVhRMlJBWGFjV1Aydz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b21dc6-8221-4ec4-af13-08da2f66de9d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 13:46:49.5954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ORr/uxOrfiB41z3o/ML9czkpQBvH7mOwXseGdh/SgHkkNgPOPJL8k1cZkvX3a5Pfa0idgPNeoT8AnS4IFmn/Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3911

On 06.05.2022 15:44, Julien Grall wrote:
> You say future, has this option been merged or still in discussion on 
> the ML?
> 
> On 06/05/2022 14:38, Jan Beulich wrote:
>> While for C files the compiler is supposed to arrange for emitting
>> respective information, for assembly sources we're responsible ourselves.
> 
> Is this a preventive measure, or you have seen it in action?

Same answers as for patch 1.

Jan


