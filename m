Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0A07A0234
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 13:13:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602220.938655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgkH5-0001k9-Gn; Thu, 14 Sep 2023 11:12:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602220.938655; Thu, 14 Sep 2023 11:12:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgkH5-0001hU-D6; Thu, 14 Sep 2023 11:12:43 +0000
Received: by outflank-mailman (input) for mailman id 602220;
 Thu, 14 Sep 2023 11:12:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgkH4-0001hO-MB
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 11:12:42 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f22a2a3-52ef-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 13:12:41 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GV1PR04MB9199.eurprd04.prod.outlook.com (2603:10a6:150:2a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 11:12:38 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 11:12:37 +0000
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
X-Inumbo-ID: 9f22a2a3-52ef-11ee-8787-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LEMKAoi5cd3EsHrJMR1msuo2nVywkgeV9D4yFDuD9v9okisZKhCGFgvBV05i2tWAy+hpScmV1b9ap5+7dwgJin8Ms/hVcP/kNYvyeM+DQ+7zHab0mRps/NQml2nKXbKlaCvgCBLGPfW9MhFalbXoQys9+uzNMnzG8lbq7rYmjsQqFfsfwbKSe51AYgo1LlWo88H/utYcVEz8M37T4ifUhoYNLw2Fy4Vfo3FJdvbkRHiGhSX2M1SpP/X+AzE14H7T7OcDMqjEk0i9VRNC6mgSFhmIxpiCbmKRDqxC6k6+eXDrWm/0Mevzy1YoTL/BVw65zaroywR5ArbzXJ6QgTQT/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GHuH5OyN4Ow6kFPPU+5y34ZC4gb8zK8Prrvnxk2EAzM=;
 b=CoEGzf0yprdNWo446jXllhKHrOLR5AyArlt+vCUKnwximGn3+iFZlRSEzEZDny3uNbAt3GsZKcqv+vx1o5kWzEur8XUKvYFJSHv5JwsnqtyFn2bYHg3fgr33TLsHIRpUzaUtF6JSxV12BPGTbHw+nl+SnFcDzf17J3jqZXQ7rURk+BI6VJSdSbP7Zh4fAS/iNy3Ebqn5u6vdqAKblJo7EJqnmJqELONgpRkHpjKagdfgYmu37HdOdT/ijKfv/T85PjmkblXVLGGW8AZkVAmE6HN6AOzl2dWgLN+BPFi3O7oKN4ioOp5jNikqHtrsfDENmHqzECJjCH/7ylOMv67PqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GHuH5OyN4Ow6kFPPU+5y34ZC4gb8zK8Prrvnxk2EAzM=;
 b=5AK8QsXNSujHKy5TSx5AqIwCyj3zugRbKy6loUiJ1hbJG1et+JYQ9rlZlgjGy9nah5+4aNcT/ZJhlsHDc6rom8UX3+YW6Xa6pfw5In2l7DJt5HTnYVZ1Q65QgsF5zkoIJXwdyl39f4HABsZ+5xo0H3h5kokC8Up3GEAgOtzWAjB5kI5Nyxg6i5hdT+19Bplp0IURmJAGGs1Yg8BqhkLo3JglvqHcDo9GnRZvt8AwXO1YeI6moPlivumcMtudNe/3HLSgW0s6Y/ImYIrV+HbT9Cx3BUD5QCvS4Sw85UCNkMrN7TGXX4KDM/IQ5DQx62zY+yhGlKBqORECCJzYDgNEeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e89b687c-2e2f-0500-d2c7-a1dc4338f100@suse.com>
Date: Thu, 14 Sep 2023 13:12:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v7 1/2] xen/vpci: header: status register handler
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230913143550.14565-1-stewart.hildebrand@amd.com>
 <20230913143550.14565-2-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230913143550.14565-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GV1PR04MB9199:EE_
X-MS-Office365-Filtering-Correlation-Id: f23ad268-7dbc-44aa-67ec-08dbb51380ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ycw62BoHy6kMcR5Y2O7Qxt6KZ8cu2k2zNs0cC9LWrDRB8sAOBAwoSx2p8TY78pIA2eUGZSUCAtffQym64m4oyqSjLVKQvCqUXxZhkKiXh9ycFPamIwRzw7YSimKT1c6dxyWeeUClKA9VIq3aYp4xO8r0hF5aoJf7OF71+6v/BxyvhfwEuLpgbjnSeJkhpcdR8D7yLTWT6zNvbdPCyGZXcrRbTn9fcxXqfY3d3WQywApSd4tw6b9rFxDRaqSkM9oAEU9RCSEeL/XwNaYPMn4no+aI+hlW1hHIQY9sZYqdomTUVbsnnv6Pe4XZnOkzu52RyfoGfB/brZmaQ9ZlLeMJ6o1BgraSgtBU783zXGpciNprvhKJpvYzsV3Jhyo46Y0hB2/Glr6xURn+YWxNS1xUkXU1Um0TTuNG8dag3h5FhfvnoE3shCK+dRowJsyb6FaRNB70FcrSJycsk/vQ2AFwZG3tnVe+JkuzqrEFRDrtWfIdgsTJHRJW1oH5I+z6FnPpeFP7dP/GIGKx8eU1ov10sb6MI1hQVble2WRUkWhz9MBFqb1NflWw41zz+cK/yAIJ95Q1JDrU/KRdRY1C9dIMQQ6Ah0dTooIlQbz9i+P66PMnQifA1R7iSpPYeATu0ApjMjdvge0Du/IoRceaFiLWSw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39860400002)(136003)(396003)(346002)(451199024)(1800799009)(186009)(316002)(6916009)(66476007)(54906003)(66556008)(478600001)(66946007)(2906002)(38100700002)(4744005)(31696002)(86362001)(8676002)(41300700001)(4326008)(8936002)(5660300002)(6512007)(53546011)(6666004)(6486002)(6506007)(2616005)(26005)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3kwK2ZBd0VNTnFwdGdLcjFkenVqY2NTcEhqSTZTWUJteEE3bndyam1SaUhh?=
 =?utf-8?B?V2prQWlFME1lTS8xeEhET3JVbE5OSjJyRG5RR2tjUWNVUTg5YjAwLzMzejhQ?=
 =?utf-8?B?UTR2U0dIRWVXL0xkdG1qbElYNUFPQXgrd253Zlp5S0VMdjRFN3Y1T3VocEM2?=
 =?utf-8?B?RFprb2UwYkYwdm15SGdwK1dkMzRPUHMyRzRiR3J5ZUYzRExpWGtHMjlRZWJ0?=
 =?utf-8?B?OUdPeEUzRDZCdDFFeW4vdVJERmszWDhuQmpncStKQlZKcTJqaGI5UytNeVM3?=
 =?utf-8?B?Z0FGRERUdU04Umtna3JQSzZnblJPRkdzWlVmWEV6K3JUZjZ1UEV0Vjg2d2Ir?=
 =?utf-8?B?MFd2RmpFSzRtTFpxV3Fjb3R1WnR5ZnZsUTdqMWIrQWRUZG1xTFFhcWNYdmRB?=
 =?utf-8?B?UlZic2V5Y1hSWjFyOUtGVUpCZjNITmh3VW9GSDI3VVlhTHY4eWx0WlRxYXJS?=
 =?utf-8?B?K2xrU0NzcHBtVDZwSUdOdDZpRkF2TWhQTjUzMVVmbExaYzZOcXhOWnVoalJ0?=
 =?utf-8?B?M3BhL3M4cnRvR3lXRnNjRzJ3V0ovQnpkbXFRNzk0Q3NsOW16aHVQeS9rY0FW?=
 =?utf-8?B?UnpyRGsrRzArWHZteWtvTEZvallkRTQ4YzZHZmtXZkMwZmxRT3ZLaGp4VEZ1?=
 =?utf-8?B?ODZMdmpGRDR0MGpsVmtLa3FQWGl0Z1lsZkFKT3FMNzQ2R3VpeHZDakxRRGNw?=
 =?utf-8?B?Y0NiNFpFTTQwMS9KUkhGcjdGMU94N3RqaVp3TEQ0NEpnVFpHVGRDUWJ4QlE1?=
 =?utf-8?B?MDVVMnJmMHF0Y0FsMXpLWS96YWNYVjhuN2taYmRkQjZJajRXNGowTUdybVNk?=
 =?utf-8?B?cGRZOHpnYVpSSHJVUVpDc0JNNCtMZFBNSDFKMnd4S1h6cXVGQzJXNWZnZWhB?=
 =?utf-8?B?N3hxVmRjZGQveXg0NGtqN3VVVitXTGdUbGY2NkVzMW44WUlpVHhac25uSjdN?=
 =?utf-8?B?VnRZVWg5cnBOODFmZ1pyZnFNZENVbHU5cVhmVWoyOVpiK0tvWTlWTDIzZjVD?=
 =?utf-8?B?NC84eVhNMjNuTE8wOGQxdXZNQU82VGNOQTRUOERrcHpPMGp0TzVUeVp2dm5P?=
 =?utf-8?B?NzVzK3hUbUdkUWhPTWJ0a1c1Z3ZXdGlvQU5jeG41WmVQTUZhVVZlUitDZXll?=
 =?utf-8?B?R3kzUTBtTkdvOElkU0ZHS3JPamlGMXllMHJCNkVIWDN2K3dFbzhERDArU1Rt?=
 =?utf-8?B?MEk4NGxzNUNsbmpvVU94VkJtSXYvNEdHY1VmZFl3OEhHWnRyaVFGVUV5anRP?=
 =?utf-8?B?cGU4eWk1L3JFWGh3a1RsNW5CMXNJUlpoeDJvMGttNUlNRnEvVjJNWndNMGZk?=
 =?utf-8?B?OG8yUFRxWDVveks4enNRMnpTT05leC9pMUF4MDVmY00wUEc1TEZHMjRlcVRw?=
 =?utf-8?B?YmZQSWtlOVhRa2w3QXQ4RzhqSW9uTzZMbjFMcmlqSGJKSWt4RlZpRHVPYng5?=
 =?utf-8?B?c1VybGsvL0VSbDRXWEJ3R05ZRXY4N1NIRExXUWhLalR6ckNvSGFBOE1XSUMz?=
 =?utf-8?B?V2FXR3d4VGdZMG1uV1RoSGJkTElQRksweXdrbENCSHlzeGUyenp4L2NSMitS?=
 =?utf-8?B?c1NKaDdZMmNHTE40OWtNMy9icUZSNEY3UEFaeHJBVzNMN3REeFh6L0lQUU9N?=
 =?utf-8?B?clVjZUJrdXVGZ3F4Yk4reGJSU1RISkhheHUwdy9GZ0dERldJaklkQ0hjMDZC?=
 =?utf-8?B?bHZsblpoeHl4NTNXRXdEYkM1WklENUF4OGN4TXpIdnFleGhQeTgxZWJmQk4y?=
 =?utf-8?B?YXJyaE91Y04wTmI0eVVwN0t3NGQ5NEoyVHpLTC8zVEo2b2xRbmMxRUh4N1Zp?=
 =?utf-8?B?NHFTWnNxQkJIY21oUjdaTXVLMzE4SmxsZDl3KzRlL2M4VXc4MzNkWXVSaHdU?=
 =?utf-8?B?UVlDM2lmRjZxbnhWYlJUYmNaRTQvOFFob25tYXdlM0huQWJReVUrd1pnYXBS?=
 =?utf-8?B?VlVkTjN4bVJJZ3JGRUVJaStpaEpNUk5wVkdGcGhVVS9uZm9UZUNLQkxjUHBl?=
 =?utf-8?B?cHlsS1F1UE1maytnRXVlY0Y4NFRDNDVwSXFUR29yRTQvcStTQlFkZS9MS05l?=
 =?utf-8?B?VkFSN2IwWGFhMGNhUW95SDJPN2NHK0VzdHlDWXg1L21LWkRMN245WHpzVENG?=
 =?utf-8?Q?GV3oS9zanajp0sm8wx4q40vij?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f23ad268-7dbc-44aa-67ec-08dbb51380ae
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 11:12:37.2251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CvLYzcWadN1ZojNRKqGOOFZNDlQhMPkr8v3Cshm65Oy7G/iiQWD1K00wVGWm6Ipgs7cI30Whr+JKCc1+YwCBAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9199

On 13.09.2023 16:35, Stewart Hildebrand wrote:
> Introduce a handler for the PCI status register, with ability to mask the
> capabilities bit. The status register contains RsvdZ bits, read-only bits, and
> write-1-to-clear bits, so introduce bitmasks to handle these in vPCI. If a bit
> in the bitmask is set, then the special meaning applies:
> 
>   rsvdz_mask: read as zero, guest write ignore (write zero to hardware)
>   ro_mask: read normal, guest write ignore (preserve on write to hardware)
>   rw1c_mask: read normal, write 1 to clear
> 
> The RsvdZ naming was borrowed from the PCI Express Base 4.0 specification.
> 
> Xen preserves the value of read-only bits on write to hardware, discarding the
> guests write value.
> 
> The mask_cap_list flag will be set in a follow-on patch.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



