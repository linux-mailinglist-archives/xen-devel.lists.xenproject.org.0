Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 463007CA534
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 12:22:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617434.959988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsKjP-0004hV-5L; Mon, 16 Oct 2023 10:21:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617434.959988; Mon, 16 Oct 2023 10:21:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsKjP-0004fg-2I; Mon, 16 Oct 2023 10:21:51 +0000
Received: by outflank-mailman (input) for mailman id 617434;
 Mon, 16 Oct 2023 10:21:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsKjN-0004fa-FP
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 10:21:49 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20625.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d043b96f-6c0d-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 12:21:48 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAWPR04MB9885.eurprd04.prod.outlook.com (2603:10a6:102:391::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.47; Mon, 16 Oct
 2023 10:21:46 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 10:21:46 +0000
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
X-Inumbo-ID: d043b96f-6c0d-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wixu2Oz3JbLOGH84B362omFXLuX23Z4AGQfrDOhfciIFGltiROtn3m5IkJ+HIvJpDWBJq7YU7iAVaRIfuW1teLOQrhzIn+Da0KJDX3GtJfcrmAWhTi2CNLxrlMnt2tOlWgEmcKEIzraKHcMvFNhxlx5DpiDxOAws17JCK18x6W9vYuxDPLMmOYYAVjXMhQMj9/VBhhKc2zbYykc71wnbJVH52DpDlqQNBqMsb2dqx7tbC/7EjCf1EF9kzM8Vaf3LDdlbpm88F0Ttfh/bEmuvWb/VaHpWtLeL0CQvgcKvRFFCmdHPVcBRmjLj2ed2H1TGiOJVNK5RjK9LCeVVrU/k2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0lq6V0PQ6+pL5KeMEiUHVXmdCbTV+gYoHGDBdiaa8M=;
 b=j5HicrgLLCBiRwuglFJvgAyeamXBJSZcLuJKSLk3XJ4NcbXUmSywidWKbDohRwKfYCNcVB0NYRlwF2H/WRp/3bMArzyRbuQW04sOdWwW7IeKf5eSKGu5Yd5HwG3Ppu0sLUuxw9TlWz9bvoq5Di69zVz82rERGNEJubdGuPZsIv0ANHgtqxl+hzxzubqTfVG0wvrE83bXlnNolxFw4jrKsUeoMSqy95VSXE5lS+0c0Jd5u+JBp1SK2bShsuv2Xn2QfAWVqE6PhUkfUafuAoxCpXGJmOCuKvm2X7Tik60Wk6PEZHFigYZQP4jDDCeAbAE2MllXvpbZUUyoSK4u0JWhmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0lq6V0PQ6+pL5KeMEiUHVXmdCbTV+gYoHGDBdiaa8M=;
 b=EzY6BSc7iSGZHljEtZVX7y/EBkMO+qCMw2Vdqd45kgmE7kFG3JOd1LP5mWLs8TYBd0m2UbS4cWwIIieTa/nPiL8oL+u8eMIwu6OTFHFiClmWFFEozu4NztEC5SznFXmgHoAa5JYyLSatyGh7JX420MMl6YMzyVHfeZxGzYVudyfw+4mYfec4U69eZKjrWf2yoTVXgsLoTlJ7ripXVubiMf2wqCeSuJ1yo6siqrSyK4AckYkREEmhmL7ooxZ7jPHwhjoj7dz97hIXK9PEVARdLJEfNtBs3ycFfS7wDS66YxiNA9JjBdC+DuJnxGuUbG9UZl45szErqPvp+eRCsCVNhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <898058b0-2a52-56ea-d4bd-c09f96ef0fe9@suse.com>
Date: Mon, 16 Oct 2023 12:21:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] bitmap: fix n__ signess
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, bertrand.marquis@arm.com, george.dunlap@citrix.com,
 wl@xen.org, Julien Grall <julien@xen.org>
References: <alpine.DEB.2.22.394.2309281616200.1996340@ubuntu-linux-20-04-desktop>
 <592517ec-f093-4789-8cd6-320f886e45ae@xen.org>
 <alpine.DEB.2.22.394.2309291401010.2348112@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2309291401010.2348112@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAWPR04MB9885:EE_
X-MS-Office365-Filtering-Correlation-Id: ba5cfa42-82f5-4766-3eb8-08dbce31b33a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Zia79rmuyz6rbC3fKN8eKM0eL2ki2pa7zuBryoQ7L9jywGv+c6fP+9B+Kgpf2J0uvMzodRzVz/A5gqe39Cw+hl+tt5ag1czP7F4UrtWJIYvaJYLPzVELBEQmRNTAIKCI0WrdRzQ1TBMaEE8brJ8ozcFJMjTSn4GP5Hn5Dt2+w97S+isvS3B49vDx5kA9dQUZmA7lp61WHqK1x71bzrVqX0i0URUb4HDDOrVu/OxFhaMdsVNeAmkwuZfI0TCU5yh5YSGVpwJ363TgGQbPFeyUQ0bv1Om/oqzhdxXYJnhmiyWz8yXpjoxNn0NctwpNrdVFZkNGWgTVhGGw66H8KC656jaHnHpwXr/LfpmAUBOt7NEja/DfD9wei7kcfwFts/eiBsUR5kLMNhv2byWQ18atIpIKF36ZnmM+O8eevUbyd3lgggyTom29E1RL1jlU8xBS1lRSdk/7HZhSp4kbpvpkBpwdvOKuW2Bu95BuzOfuP4pJl9hTq8dAdtWpHzxl2l2HFDWVgP98Lqk3jYjUyO2a3dOg21wxw4Q+U9U+5w/ER2UZq9fjMvbqM9iXK2rRmwGODSTBnqezsChJF6YxheWL5Dlu7EApyKWL3q+6vXJaeXeQ3wnd/HAY6U6FBHCgirx+E3kT7plRFl5nn2ZHkvt4nw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(136003)(366004)(376002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(6486002)(6666004)(478600001)(6916009)(66946007)(66556008)(66476007)(26005)(53546011)(316002)(6512007)(2616005)(4326008)(8676002)(8936002)(2906002)(5660300002)(41300700001)(36756003)(4744005)(86362001)(31696002)(38100700002)(6506007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2xPdGhXd2swVDdoaXgwTWEzVzFpL3poSlY5TkRVWDZUQlZqVjhma0lKUXRo?=
 =?utf-8?B?YXBvcy9kSVNIY0VyblQxaUdDRzVHRUJGRE9DQk85MjlkTVhaQzFydmJMVkp3?=
 =?utf-8?B?Y0xUQlBkeWpERVU0UnV1Z2haZjVNM3dnZWxOM28rR0lFRmNsMmlUNzNoelE4?=
 =?utf-8?B?SDFWcVdxZ2ZOcUNlamxGbUdwNDIwZFh3WlhWOXBxTm1ha3RaWk5qOG1FenBL?=
 =?utf-8?B?bkFEZkVWekhlYW5QSUd0WEdhM04rR2tPWDhmWDErSlM2NGZRdm9OOThMMVhP?=
 =?utf-8?B?Z3NpTFJTT2o3SSt5end5Tk45YTVNWXo5b3dmdVM3Z3lZc3NFVXdwdFQ1clhC?=
 =?utf-8?B?NGdmY3plbG8vT0h0ODhkVy9qaEUzYWEzaWdkRXJRS2RsTSs2R0ZYNElkMWZS?=
 =?utf-8?B?N0d6VXRkbWNWeW1YRm1kLzBjVk1PQStaWFloYldpUHVSZFMyekdsZTBHcVB1?=
 =?utf-8?B?STdrVGJJT3JpY05oMDdic0JTVDVQYTYxemM5cHNBRmRzYW00am9yeWdRQ2dy?=
 =?utf-8?B?V3RRd3JEc1FsdVBnRFNMK01NdmgrMHUreVViQ05ubjZsOWp2QVhHUWFMODNG?=
 =?utf-8?B?dzdLSXAwTHBmRmhka05FZHVoUkNZWFZrcm5QNW9LWXk3R251V01uTjNBV1NR?=
 =?utf-8?B?cmgwMkFRQ1hwUVQvRHpJV1IvcWhSRnM2RmJTLzRBeTQ2S2g2YjhEVjVBTzNo?=
 =?utf-8?B?VVJnRFNRdFFLRW02QXpXWmVwVnJkRE9wQURaTWhpTklQRlRtNHZxcmp3M25U?=
 =?utf-8?B?MjlxTk5GSnY3QnI3WWViV3BOYmFnN1djZ0R0WXlpZHpjVU9YbDVPaFozVlov?=
 =?utf-8?B?eDBQZTBoUVZrYkQwYmZuTXd4TndRWk1zeWR6WjNWUU9haW9LK3pWazNOang0?=
 =?utf-8?B?bWhEekVEZ3MvTWJGaG5JS1U3cWRWR2MvM1kyZU5mRk9Qcm9wUDdnakxHYkY3?=
 =?utf-8?B?QTN5MzNzTXg1SEtoWThXMGN0WS8rU0Y3VjRpcXNyUlNTWENrdVhGOWF5UFZE?=
 =?utf-8?B?RnRPQ0lnWWR5OTBBamV6TDErZFd3NDZPWWx6V0tJZEZYbWpBNUU1cHJsdE5L?=
 =?utf-8?B?UGUvalNoOUh2c0djWWdqVnY1OUZhaTFnVFJ5Q3hsQUVDNk9VeWxoTThtRWpW?=
 =?utf-8?B?OVJzNUxJcXFiZlUzOG5oaFBrb3cvQzBQNEJ1L3htOFo5NzY4eGY4SDVoajR5?=
 =?utf-8?B?U1JGV2F0SlMyUUdlaFYxZkxiUlU1Yjg4OGljSkFCOXhZclNOc2NWYTJVSnVQ?=
 =?utf-8?B?K3ZJQ09rQnJaR2VONDJjZWJmd2RvSm1NTXBzcFNzTytKbSt4RVZDV0sxZGhk?=
 =?utf-8?B?OTNSZ1dXd0N5dDVaU2dyMzZ2WDlud2hSd0lFOXdqN3ZLbXZKWGxEbUJreVNz?=
 =?utf-8?B?enc1VVR0MTdZRlJwcUUzSktpZWRDNGNoZ3pPRS9wSS83U2EyMjNhM2wzNndp?=
 =?utf-8?B?RUozZUpkOEJDdXVHdWxxbjllbzRvOHNOdlEyQ1d2UDJORzVuM1ZwMlZzcTJh?=
 =?utf-8?B?L0NEMnlDWlErUFBlaFFkRFVIaFMzbDJTc0tIdDBPdERubUcxU1NNVDlTR3VL?=
 =?utf-8?B?ejZIa21hcWZVTlR0Z2x0MnlNK3ZCM0pGSnVDa0VyWjRWdTg4NDNJT0lyelpm?=
 =?utf-8?B?SzZiUnV0T0NnV0d3aFZXc2hRWnBkSHNmQUhMRURXSTMwYXlFS0pIK3czYTY3?=
 =?utf-8?B?bktCV3RuR2xjditYNUtRaDNGRHdPeEpocHVlOFQwWkV1NTBKVDhmdHA3VVph?=
 =?utf-8?B?bmUxUGJaSG8zSTZEcFcxMGNsL3ViZGM5Uk9DRDhwNWY4Y3ZJNVZvd2hWMzBW?=
 =?utf-8?B?OVNjT2RnN1l0WFhtZjlxTVBNUm1hQkJtMFRIKzRRSDJBTStjcnlRMUNlQ2Fm?=
 =?utf-8?B?UGRzUkRONUxxd21SVmljRjJyTWNINWFsb2hRVS81NlF4bEhyQy8xTnZ3dm9y?=
 =?utf-8?B?Tmp0MUxwL3FnUjJhem9Fa0QyNS96YTFqTjRDK0FzUkM5YzA2THJyRHl6RXdK?=
 =?utf-8?B?MDZoMFFzSWg5TGpnZkcwNWgzT0g5aHVGN1lGODU5RW02b2NrcFhmUWFLOUpq?=
 =?utf-8?B?b1FCRU5YbmRJZmZwSGF0WlRxSWtlek5rM0VKS254OGNJUDk3c2tLUGZ0M0ds?=
 =?utf-8?Q?DKPRPMqY2JeaVtQmdeuM5SEmZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba5cfa42-82f5-4766-3eb8-08dbce31b33a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 10:21:46.1984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: erOH6L/rOBs2SMlHpKmmgqsBXgKtzxiL1hpdc4Er+5prqoU37UEWLAlVDFLMquU1obnN0wLE8KETCQtXLcpYVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9885

On 29.09.2023 23:13, Stefano Stabellini wrote:
> [PATCH v2] bitmap: fix nbits signess
> 
> To avoid potentially dangerous sign conversions in bitmap_switch, all
> the callers of the bitmap_switch macro (which are all within bitmap.h)
> should pass an unsigned int as first parameter.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


