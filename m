Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1183C8968
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jul 2021 19:10:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156150.288138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3iOf-00011k-7V; Wed, 14 Jul 2021 17:10:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156150.288138; Wed, 14 Jul 2021 17:10:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3iOf-0000yI-4L; Wed, 14 Jul 2021 17:10:09 +0000
Received: by outflank-mailman (input) for mailman id 156150;
 Wed, 14 Jul 2021 17:10:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OaxW=MG=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m3iOd-0000xz-7I
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 17:10:07 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9212a1fe-ce09-4ffc-b4f3-035eaa5326a0;
 Wed, 14 Jul 2021 17:10:06 +0000 (UTC)
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
X-Inumbo-ID: 9212a1fe-ce09-4ffc-b4f3-035eaa5326a0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626282606;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ceE4sEzDX4wQbrsCMyMM2UaZxQD37releBEe9xOjaWg=;
  b=cp1yRI/yQQcr0BlkwZS84SwLxtQX8tTfFGeMBRHTKitGYAxyPykFq6yG
   uqjlgjE3wwTPWMoC1AoR79TXHnVoDR1ghwe9DTYu8HcqQaAXlEEIMpjaN
   xHFKr54skOrav0deuCxCMvFCDR0z0b2WMb1jF9yKY7X12SwP/+sFrEwGF
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: DSSuIBLjwgcdHVAGfIahrOqSD1+Q7pEz/Iynto93P6C2iZFVkZgax9bA6tOMLDC3DiSqhJV/qe
 RFv7eLgplnhm0lRm080q3dGbu69C52tJimsnPs4iWxrQ7UrhJhpIFi21PD7jXwsAC3jPKd1eVV
 n5iv3OqrL94Qp62xvPy8KYU+aht08R/FuuiW8g/aJrTfXais5mZ2R7h6tFOqTC+q1P+HHZ59Rw
 dUmrhVYNMECVgAYKc7QlJcY+VTzzufNAJJ8avVeMR803gzAFTfd/NMXp11aP20ZWhh+eg+rSWg
 cvI=
X-SBRS: 5.1
X-MesageID: 48338280
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Z588b65FUCHjHZLAIQPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-IronPort-AV: E=Sophos;i="5.84,239,1620705600"; 
   d="scan'208";a="48338280"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJjzoWNxab5XPvF8Ebt8CfZpeaM9x2BQbOVEW7oPB2monCDviwXU8Lf/iTrtOI+KHUcu4BCg81mFZFYHT0Pa0atW+QST7ddHz+vyuuYq6KXnB7k699bpl29ZiOkvyFYZZII0IbckiQM7LvEJGgqo6eVdnJL69bJTCOFj09pi/R7vU0kq3+YN/vJi7KRHm1pIlfPiRiqnvYCHymiKPN0esGL/QnrAXs2awfBOhCrihJRV1xlNkk0WPO8s6Yj2ZDtr9YyaGhYxuTFSidiv+Y7gvlyTGDLDAV74wEWYSrHUGjaSC/Ehjn4eBt3DgO22PW57HlKUFY6wOB0tf2l+X9LODQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ceE4sEzDX4wQbrsCMyMM2UaZxQD37releBEe9xOjaWg=;
 b=hn7TrC0pD48+eGXq+61QPYOo5M266QIi/ZgGIANf1t4yxxx3mAx6PSLyYNprAOdWr1GKgZVTe6Oezeeq2exfx5SQSPepGTAKoiHrZMrl+ybV+8//OmccIGwRzWgFFToKiZMiolfXxEfMUyGTxRcN5I3W0sNjip/yWOcpDmWh4zmfQBtGxGvRfKFzu5DAjBQXJGvVbLfQiZNEYYCMP3c1SdkdS1pgAQfbgZRORV98ZaTaJyXZVfbgi6DgTr30hnXlX5uUu1TfKG1e3uO79RRo9nZdKFyC11xgXxQ+XeppL1ahRW/TqvUUaUqn4QyEOo/eRlWLFSaS18FEj+W2b+hPbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ceE4sEzDX4wQbrsCMyMM2UaZxQD37releBEe9xOjaWg=;
 b=NZlWTSfTGr7SvEvSBN1ZeFzAGS441j7AAiWDE5g2hqoNF3ld0iXrous03B37xKt+1d3hiVpUWBNvVF2gWUhi7R4qFhh/7itWirE7s4lh/sY/fTR68IjMCGjrX1osMIbfXIJWVznaXopMRuWQr7d5Qw8wXc9pIfDBC3HjY9pgQwg=
Subject: Re: [XEN PATCH] xen: allow XSM_FLASK_POLICY only if checkpolicy
 binary is available
To: Anthony PERARD <anthony.perard@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
References: <20210714161734.256246-1-anthony.perard@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <21ebb9b5-ff19-0c85-25ca-519f39bd1b14@citrix.com>
Date: Wed, 14 Jul 2021 18:09:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210714161734.256246-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0035.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d93ab008-3fa7-4c14-efc9-08d946ea377d
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5438:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5438452F2C0154D08FD1CF8DBA139@SJ0PR03MB5438.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ew3RpTgs9LPT/88/kwwvq7eZy6SwdlWuNcEmGLp7LTXORy5Qvku5TZTGCzVz70H9ZZ9WmRyTKAKzOP0v+0FtmEx0MlLujG3bdX1MvK4hB09mbsCQW/L66GbXb/g+a8sUhZiP4nhAHrgASBDZZHc5wrM7ZLF2LTuHorAE4YvofUow/AFG7o7G93Uldkx0shzplo+MJNnU3ULKjmkw6sRBMwFLHt0bwqABSN5cTQZJyNc+zjhsjf8bT7L7AbMwauHLHP81oEk18P96tNzzJWtskYiiv8/4Fyu/EUfyjP+wMaIlJPo3NPLWXWjlyttkpiOqneiM9b2xHVt5wqR8VcgCD3mvcLMhr7cdsHSqEEzwTa4dg+QRwKiZF6HlzU9HZ7zHBg/bhia+wWDV0cKvPDrDtbJBTsiki3THiJ3W2T0S1JNwUL4/9+xG+r6+wXPaMH2UzZN2ux2imecmbU+JFtFmwRgFvuZRTf7lSNqWBLDBXTDmo8gkhgocb4x70Qu+ZrWaa3MtIho6p+kNpmNjlEZPoxHc+CKCI786WDGNW4DqqQBPqrIZRzeOqaASTM/6To0UnHnh1cbs9rfQ/Hjgzh28uG0DSqotyAUrKaY0wFIMDEdNi9unVymlTZmixUBBtkj5n3d+2FCXX7Blc/3i3R0D3pCkLK/gd7tD2wGHtIsltJ2BiZbjFb9R0GmiClrF+o1UQdZd7OwwumSo4ItFEkc1ToBhFWau476QgIh0WgzMXvI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(53546011)(5660300002)(478600001)(186003)(86362001)(36756003)(31686004)(6486002)(8676002)(4744005)(8936002)(2616005)(956004)(66476007)(4326008)(6666004)(66946007)(31696002)(83380400001)(316002)(16576012)(38100700002)(54906003)(66556008)(2906002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHhwb2E2Q3RrTG9jc2YwVnFUeXhNRWRjMWtyMURxVXpMYVQrQThWeDVEWnhr?=
 =?utf-8?B?TlFtNS8vVDBaMGNSUHdQNUVoazBxVytLOTlxZXhDVG1hRDBja1ZSVGd6a0tN?=
 =?utf-8?B?VTdJYzBKMGRqNEtqbTMxRWx6TlJ0Q092UTZTVzRHbW9QZkJ0UDh6MFFTT05a?=
 =?utf-8?B?VlN1WlduUGRaSVdkbXprazdVN3VwaFpmN2JZQVI5c1hUU0xqTFpZUUJhYTEw?=
 =?utf-8?B?SGlqSzAzcFdXSjVsL3hib1U5cGYvYTNDS1hyOXVtWGd5SGdMWjFHU3FOaEE1?=
 =?utf-8?B?Z3A2eUxtY0hEQ1lkOU9TaGFVMDM0TnNieW1GeFpoR1daOGU3RVFmdjFlWktH?=
 =?utf-8?B?L1R4dHVTblB5Z3F1TmVKbG1wYzVTT1gzeXRzMnJIUWJUMkRvcTN3K3lNZlJB?=
 =?utf-8?B?WXpGQTVDenFHTlNzS3ZBc1BjRjZLb21WZ2daNk16ZW5rZ01HNENGQXB6ZXBn?=
 =?utf-8?B?U1hvbE00QndPRHh2MlZRTzNvZEQxVjYxWXVTWDVYNkJoQi9nbURXMjFNaElE?=
 =?utf-8?B?OXQ0a1FQMmFUTmlzRkZRS1B6cUVsMnl4Nk1yaVJoY2wxLzdhbXpsbTJKQ2U1?=
 =?utf-8?B?bm13QzNHYUdjV2RmVEQ2cEs4SGxRNjNrR0hzdTR0elpBbnBacGMyYzE0SFNu?=
 =?utf-8?B?QjBZT0E1UjlKaWZ1WnoxUlRGc3Z0OGowOGY1bytPKzBRdTIvTVJTVm5zT2s0?=
 =?utf-8?B?bFJLYVl6K2ZtYnRtZk1PcVRoaDBibHJJWkZOSU5JbnQ4d29abzdQWUpkZlYy?=
 =?utf-8?B?c05CcWVvUEQvZjh1ZTRIZkxPQlVzUkpGQlh4QUg3MmlFQkNPWEV5WC9OWnFw?=
 =?utf-8?B?M1dFbzNoeldWY3hqNmtzZ2oxZmJlRUhQYmNVQ3c4V01rNE1YZG1VM09FV0Vy?=
 =?utf-8?B?LzhsV2Qwb3I2S0xsRURvdUkrUk9ZblN2TE5yZ0NtVXpTeExSdkVwZEFET3ZS?=
 =?utf-8?B?V20ydEh3RHNCVjVnSzhTWkkvTlBoUGs4TmRXOXUzTVAxM2NnTWxtZXRnZXpj?=
 =?utf-8?B?bWZhMldzMzVub3FXdmRSQXlwNVIwd2FINTB5RzJCRzJVTEtQSnFEWDVyazc1?=
 =?utf-8?B?UEVTdU9BM21yZG1nVmFTUXk0dGgxUFN5L3Vnc21ETmpUZHhlY0FIRzBMQnBL?=
 =?utf-8?B?VHRDMm5nVHlIY3BRT0JkdzEwNUlxaUFWQThPYVQxY3FoMjluRDNwa1JnVkN5?=
 =?utf-8?B?YXVaOHBYbHF2TjI4a0ZSK0lqSDRWUlpNV0RUbHlXeGVWdHpRenRrMVc5NG9U?=
 =?utf-8?B?NXJvN0V4ZFMybGs1WFNUZytwK0lwdEtiek5US2E1Q0Jha0lYMHhITDhxdEhj?=
 =?utf-8?B?b0pQL1dZVURWWUowZERRMXVRZFhBdXEzRHI4OGlIVERuZ2QzMkY5YVVDSStr?=
 =?utf-8?B?UFpaR0FpT013bS8renBpSUkrUFNETGE2TXZJek9oUExWS0NBbmhMalkyV25i?=
 =?utf-8?B?QTBJbzNCVlhadElOOWdEQjA3cFlYVExUNXJYUUUyVUVMRk9MTm9EU1RVbWw0?=
 =?utf-8?B?bWJrc3JiU21xS09TeEw5WEJmRkZOa1hOUDhDUXNROWJ6RC9aZkZNdjhvUlor?=
 =?utf-8?B?Y0NwS1BXYTlEcVcvbUlyV0p1VDdEL3pjZFZqRXVpOElCMlpDdDgvbzd1QjBk?=
 =?utf-8?B?UVgxdnNwSjJvbndFdmFLelBGdkxMT09CR2RvWXpINENIdDA5ZXd1S1lvZ3o2?=
 =?utf-8?B?cm50VS9zWWtCK0hnYTlGNkgwK2gyQXMwangrWHUrVGU5TEQ1bFZSbHREQWRV?=
 =?utf-8?Q?jv+k8p+YN2EcWyHMzab+oUcYn/th0Vk/IFqN0+m?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d93ab008-3fa7-4c14-efc9-08d946ea377d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 17:10:01.8246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CU3rKuxBCxR5gchpM4MZFbBzpLh/Vx8VQifyp6dCeiOlumn/6rHjHrbb0ABBNDULD1ZixYksDgewhmvAa5Z/EVhSKEHizjY3JnrJ6Y/Gsa4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5438
X-OriginatorOrg: citrix.com

On 14/07/2021 17:17, Anthony PERARD wrote:
> This will help prevent the CI loop from having build failures when
> `checkpolicy` isn't available, when doing "randconfig" jobs.
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Thankyou for doing this.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>


