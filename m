Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C7A2FA886
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 19:18:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69965.125470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Z6b-00062p-72; Mon, 18 Jan 2021 18:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69965.125470; Mon, 18 Jan 2021 18:18:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Z6b-00062T-3d; Mon, 18 Jan 2021 18:18:21 +0000
Received: by outflank-mailman (input) for mailman id 69965;
 Mon, 18 Jan 2021 18:18:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wFfa=GV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l1Z6Z-00062L-Ja
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 18:18:19 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48eb22ff-d532-48ae-8f10-cff1b0ab23d8;
 Mon, 18 Jan 2021 18:18:18 +0000 (UTC)
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
X-Inumbo-ID: 48eb22ff-d532-48ae-8f10-cff1b0ab23d8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610993898;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=pkiaSCuHz/vENKLxSha/ds8nuy8ssaF3z9bWMMR44pI=;
  b=RT1ZXaSzkMskao2dNzFcw1F19ATULILAY8jlznQMKg3KgWdN0zMd9fG2
   E4SOEd8D8dI6bbuZ5n8OqBE2umtC+Vh9StkFiBwMyT8rfOhhLXuUUydTi
   PdjagLHJUtFEpb9bNQSVUK9bPIk2SwqjD0lKgpxmouhgC+WZcIrkNh2wt
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rWJsY4JL9fDrHehXCPjbwe5Z4gGHNSuPxDxY5uZ+1qqGnT8ucU1JZMN8KH0asg9ocagAkCuB6R
 UGY9loASIhUm8UJfIJIS8l7nygAZJBJaWAYnaTZc/OIf3rGnOwKQt3nwzIpmIqhFttilh9OA88
 PJMGc/uhC+QNL1gBudYdNXPVxMAVMrGa4YXjS0azpSE5/DmbWDi4Hw4lDZx/WUIY/ApNnl4CKj
 0ySJ+fmvCphwe0TLpB76uoBq+fGyKk4BN1mvOMSqe88NPV8ECKMuViyIG1ACO0dKpQhcAmz1O+
 0JY=
X-SBRS: 5.2
X-MesageID: 36614234
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,357,1602561600"; 
   d="scan'208";a="36614234"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNa4vVR0hrNvRtd38tBWXxpfAP7dAR3kvwcaFO7+Ntgq1PKhYA8lssPv+Y586d3XHZQXDqptimo69aLwPdL3b2wtbFZGNr/nkgKpgzOpzm+eY515ok9cdzU3t+5UweymM6UD7+KW4paNwoOlLeNb5xFm4e1ClRnnH7lXllcJijznkqrMVxFCraSBoy0RxQhr+jGCGtJa6A1ISfOp626R0ZO4+/ZNNyEdijrBoDypKkTJY7w7GjHOu+kS/O3hzBGCw5LE+7YhHFe3U+lywJ5XhCczDOAKVVs0laSYWiuTzctYnK5qD0tzujpg9VxwP1PtZnm5g9QewraxZiSSx8/mMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vqn9U54yqSBjEU68kSmnmzL77MIXewwegH1td+NSHRw=;
 b=Y1VV99dBk/QweQxhKDqIYWeRV9+UpcOtZ1Sh9nyZPqX+q8i/CBcERUvPR0ECt+v2VQjEkDXUiiwc4UlO4IzGAakutmSCqmES9RSYVhAXTiuOwEsf9wzVRHtvbywFH3oWnJrhse1QKlUuF0Qihz/br1ddUJWIW6zb10EbJfb8RkU/y7oNP6FPaDupwwnxMkpvBDlmYxBIhfmyS3J3Tbvw/JawupMxDAGNPcXBE5Glz2Ou+irldapvzAeR7msdr8w+S2vpWcQaP4hLwtBPxeyFLLe8lpzFxONw6MXLDv1HHogo8xAFjzKE1mwrcDQeB/4+9lTpHRu+cYY06OYAQLuSXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vqn9U54yqSBjEU68kSmnmzL77MIXewwegH1td+NSHRw=;
 b=XcmLHRPaxxEcAf34y3xYaqZeoKUxjrOtkx4zf18xQXHJs9GjkSn9IbBbxEI39aBu/2KqqAVHGm49l7qhg+jnB/8jCZdq8sAFdRuJrAk88sRt3yk3ltxqQBSZabsvAFFSPe9sZGpIEOL8A67k0ciZTmlGnz4LR5ofbPONnUNZ6jA=
Date: Mon, 18 Jan 2021 19:18:10 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>, Manuel Bouyer <bouyer@netbsd.org>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] libs/store: make build without PTHREAD_STACK_MIN
Message-ID: <20210118181810.tplidyb6hctmxkmh@Air-de-Roger>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-18-bouyer@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210112181242.1570-18-bouyer@antioche.eu.org>
X-ClientProxiedBy: PR3P191CA0056.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd61c58c-d66d-467c-1dfc-08d8bbdd6c99
X-MS-TrafficTypeDiagnostic: DM6PR03MB5321:
X-Microsoft-Antispam-PRVS: <DM6PR03MB532145B11F3583E5D6FF18858FA40@DM6PR03MB5321.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MOWOe5qEXYePfEE1BPUEFGYbSCQ6a21kFvi4SIf/VS6j8iqo5Xv6QD/Mv2J6Qd6O6Gi+s2YBds2oz6rFz5MGyre2g+3XfROhLOGgMVYZNEn50lYWy2XC+syss6kSmIihl8Cc8XC2CnGDmOqF4RmL/+rryYhIO2kin0oVpwA0uYpYyoVwKaBtmVfN6MK44RrJ4loxhMwsg6AC2iy7O966f0Z+etISpn5m7PGjwvBmeIOuBkyJ03UmcFd2N/wVbZ2b8a+w65mWiH8hi9P2XpCHa5A/NuIytxqOk8MoaelfFp07dvge34Zubr01gG1Mm9mafX6popEKiuBVofXXHv3jC+Qt5yPEIc+SNzvofkrr1RxjmycGUxVs5OeCqG77d6whS2x1O8S3ojKKPDeozhaqZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(1076003)(66946007)(66476007)(66556008)(86362001)(6666004)(8936002)(2906002)(956004)(6486002)(8676002)(9686003)(33716001)(4744005)(5660300002)(16526019)(186003)(26005)(6916009)(6496006)(316002)(85182001)(478600001)(54906003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RzcwQmk2aWRGamlhYS9jQmFYcUlPQ09qckVmZ1F1ZUJCOVJyMzg1TnNmV3hz?=
 =?utf-8?B?U3owT0JYZXFqY25yUC81RkNDNEhybHI2NU9UZkYyZk10M2t3ZGc3WEcxbnRu?=
 =?utf-8?B?NHgxOFp1dUhsb3lpN3Y5SzQ3RmZsUTV5TTc5bndhaWpZa2l5dWJOVTY5T0hF?=
 =?utf-8?B?U0JvSlZZaFlrZWp2UFlsN3VEaDA4SjNrTStHelpzUHE3MnRhdmZDQ20rZ21U?=
 =?utf-8?B?ZHN0U2tFcGF5SjRsKzJaRmxzeWZNdzJKTXRlZkhVZkxoMWlEZm5tUHk1allB?=
 =?utf-8?B?Rjkwd294ejErQ1hITHdIemdUd0g3TlpST09jWFJvZDZQei85NUpNVVZZU3pU?=
 =?utf-8?B?U0h4R2VaR3p5YkJCcVd5ZEUyVUxxYXZ1UDNGNHFuc05mcjl2bENWVjNkU0tx?=
 =?utf-8?B?OHY2M3ZlSjNtWDlwaXJqNEUwZnVOdHJ1Q2hSWkRmZE1pNkFzNTVSSU42czRC?=
 =?utf-8?B?V0ZGcHFYTzlSS29FY0xrSjZsMFRNcVRMbkRON2tUbnE3OUhlZ3ZwL011djVw?=
 =?utf-8?B?dTlPRWtXT1dhaUVmU1hkYTlpZlNMSG1CZUpxNlhQZGp6ZHB5cGIxdGt4eVpj?=
 =?utf-8?B?MlZJbDBSM2NrcVluYjI2U3FJL2hTTjZ1YUNsaFNpVjlkNnhTUHV2WXVJazc2?=
 =?utf-8?B?QUFaNkpjRjJRc05CTm1GNzAxcllORFJneVV6OFdYRDI1alNzbUk4RFJsak5V?=
 =?utf-8?B?a3JkdmVqOUh1VmtYUy9jRFd2emZRajArUHFxbWdHNURqck9CVXFoY29YMlJI?=
 =?utf-8?B?RDdBWmZKQ1FFY0dvMGVnbDNnQzZ5eWdnL0hPcEZodDZia1BCcXg1dkJSMWtQ?=
 =?utf-8?B?c1ZLaHBiK0N0VERJai9pYmlmbWN2TUtkL0Nhb0FHdHUwU2tiZnJwaUVwWjAr?=
 =?utf-8?B?eU9IWC9wVkI3QUFMSFV3ODVMdlovWUIrYmNJSkt2VWtqSGgwUnpEZlFQaDB6?=
 =?utf-8?B?bW9JN2t0N2JxdmlUazlIanFDZUlqVHlZTnkwdlV4aXFZYytTN0ZaZlhTSy9S?=
 =?utf-8?B?cXdpQWk2RzEwSW1uUUFIbWo5QmdtQzAvL2E4ck9TQU9CSGkvUjlHZlRTcWta?=
 =?utf-8?B?LzhFaUFIWmw4czRWUnVKZUxTd0QzNERCU0JFNm1HMFdIZG9jci9Ua3oyK29Y?=
 =?utf-8?B?dGdTUThLbWZ4cGtSRjJMa0dQMHFlM2s1T01xNDVoT1hXeWZFZng3Nnc3WUlP?=
 =?utf-8?B?ejkxSTFUWmhQeEVGdFRWY0Nid0p2cEN2UnlXaENNMTlSdG5QYjVlUnRWamFR?=
 =?utf-8?B?bUtTZlFkYnRpTG5NaExpRVZHZjdPYVhOZXdUMkVsR2RDZzVTc0xBVWZZTkN0?=
 =?utf-8?Q?O7JVX+9PacS7zdn/CVBw6KGvvLT6VWaiAj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd61c58c-d66d-467c-1dfc-08d8bbdd6c99
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 18:18:15.8280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tIgCfHMSLJJHsb+zxBSiw1Vc+suKS10VAgN4C61GZjVrvw6CW2KY41d4vSnzUN3xi77Py6/3hUVEjJLrWMdvRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5321
X-OriginatorOrg: citrix.com

On Tue, Jan 12, 2021 at 07:12:38PM +0100, Manuel Bouyer wrote:
> From: Manuel Bouyer <bouyer@netbsd.org>
> 
> On NetBSD, PTHREAD_STACK_MIN is not available.
> Just use DEFAULT_THREAD_STACKSIZE if PTHREAD_STACK_MIN is not available.
> 
> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

