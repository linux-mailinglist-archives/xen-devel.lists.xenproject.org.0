Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8A06623ED
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 12:15:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473527.734185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEq7b-0001El-Mf; Mon, 09 Jan 2023 11:15:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473527.734185; Mon, 09 Jan 2023 11:15:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEq7b-0001BW-Ib; Mon, 09 Jan 2023 11:15:19 +0000
Received: by outflank-mailman (input) for mailman id 473527;
 Mon, 09 Jan 2023 11:15:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IK2Z=5G=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pEq7Z-0000Uj-P8
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 11:15:18 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4565d2f-900e-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 12:15:16 +0100 (CET)
Received: from MW4PR03CA0101.namprd03.prod.outlook.com (2603:10b6:303:b7::16)
 by PH7PR12MB7869.namprd12.prod.outlook.com (2603:10b6:510:27e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 11:15:12 +0000
Received: from CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::f7) by MW4PR03CA0101.outlook.office365.com
 (2603:10b6:303:b7::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Mon, 9 Jan 2023 11:15:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT020.mail.protection.outlook.com (10.13.174.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Mon, 9 Jan 2023 11:15:12 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 9 Jan
 2023 05:15:10 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 9 Jan
 2023 03:15:09 -0800
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 9 Jan 2023 05:15:07 -0600
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
X-Inumbo-ID: e4565d2f-900e-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1/+2q7QWZHrBzeI83U4dvkmjyRXXPMNuyccV+cP+S9qq5zXz9s8TolbEL9HHpYcBeFQwAFOGJJJ9rwBwRllSkTvrDp9CsFgoz8RIePboDZyn5yPyU+b6OlL6xwJzBREVVKhPB9tta/o5SOueEsgLRTT8LG3VfNWhzTSOdG5ByRorSqJIp3c74mQZcG5nP7wWcHWpiJdkzygbnbHD4TClFLr0aJEIRBqceMUOjoWrFRQVJdMohuE3cZUHN4tsGgPk92G0o7B7BAJX27zOMKhCHgWQIeoOm0V9/N9A21IHk4799rkG+GfnpNDpJZVHKa2rdRA1JTblmDSA/qgSWJ8gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxPfohhAy9Pfz20exhjw8wrurETc87GXeKs0KT+jF6s=;
 b=PovTWRX9ik1Ysh+NbGNPglzQhIaH+u8k+vRQhw6GMidSebVDWY8PrD81TZ3V5HAChTqsI3/ojp6NJ3w6HXbw8rqKiS7sjilQ0SRIFdtoa7cVUoGwAn9TlJrYsFmayu4xnc5A9NiVdfG1HUecAHXS2aIXX1nJVYIZ6me3UyjJVmY1V1GpwRWFGHwUxidp22sGKy6pwCCBNaBISTGZhGcDKlCJXE/Mgmh0BdasrITWnh71cHbodes3RgIv+Nt/6tuEq1S6GgQR+pnHE2+ccQ/3rtNzcAn6bL2yMAfwVvx6ji7O/Ip2cnrkg6C+CL/WyL5LHznfggtXvIxpMmAlvtMNVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SxPfohhAy9Pfz20exhjw8wrurETc87GXeKs0KT+jF6s=;
 b=exYPtEsf6nAR5X7o4U9Gi/Ja4Oost7tRYjFl5rBFOwSMEJlKD59PfGfxMvLYmIG80V5OvXdLT1Ss5Cg33Do6h3Q2zBo4dUO6JmF2IR4Lbo+mcMdFovOn/ZBZVQYbaR8QSSSktbLdIPyiNccTNd0OuBbNdoFlZuIByluIPQZAhbw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <6373383d-d6d3-3d92-b09e-6434c5b5d15b@amd.com>
Date: Mon, 9 Jan 2023 12:15:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] xen/cppcheck: sort alphabetically cppcheck report
 entries
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
References: <20230106104108.14740-1-luca.fancellu@arm.com>
 <20230106104108.14740-2-luca.fancellu@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230106104108.14740-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT020:EE_|PH7PR12MB7869:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e715692-6bc9-481b-1535-08daf232c6d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W9TL+z4cfEa+hSAGxMhbrV7dQZkzoWSohH2eFzkT16VHHCe6vIDfIigIQTjy/Sz8+iq8ym6AAr+At8pyoq+hCUVwZR4eGfqcee9ye8UUZk/Bw1iLhfrK7mwk14SjHp2jw8b1rGaaZdOSao6m1cCjPgPoZ4Yjc2Hw6rkG2SneExZZ5Lng757PVBzYH36/EUc+E3+3UGEplF+4hPNMwdsfJ9OkycHAdxfI6B5pyxZ5vqovuFTkDk1C8IHDScw2LTjg2IzTg0/aHsjMCAuQmuFnohnbrxVQzM1ki8VMOe2W1ZQ0pft+GA6y8Ei/Fxgne6+2XW3E2KCQv+Yis3VkrMU8TAeX4ldIBMHXo5K5uQEB8kOHUMZjtUKQwL+11Vo4ZEu4D6ZAgpMF47zlyk1PjfNY9s1MyGLOpgn0FOibwDYDEgjvyOe3JsLuJ+qK6XnV8Dtq+F2BctWmFHo9Io3fpXyRbkXewErIiltuIgO+zsL3AJdkT8EsvH8eN6D2CRGzr6XFJC+0OUNE5eJ3srcKsIH4Al20lICyE6J0G9VLa8MCTlDBv/x3NgdIx/QvbHNYzsnPW1xnR1AwDsh9dG0YrLzjDzhM5ytlOQgeG0QH71mvLsAK6FR1G2o+irLaS3WVeJGP3ZV0pdT0w9543vRFLeU499LiAzkzUCZiUryx6Rga+jf5IbxikpcEh59y3+joVyVDpDSmOswaXrcm/IY+UzfuhKVOakC0BmhpRIPhoQrEIcH+zzKiq9wRlFeR0zibz85xyu/qeNGO5FXmi6se+NZ4HA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(36756003)(86362001)(2906002)(356005)(81166007)(8936002)(5660300002)(82310400005)(44832011)(41300700001)(82740400003)(36860700001)(47076005)(426003)(31696002)(110136005)(70206006)(70586007)(54906003)(31686004)(53546011)(6666004)(40480700001)(186003)(40460700003)(8676002)(26005)(4326008)(16576012)(316002)(2616005)(336012)(478600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 11:15:12.2924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e715692-6bc9-481b-1535-08daf232c6d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7869

Hi Luca,

On 06/01/2023 11:41, Luca Fancellu wrote:
> 
> 
> Sort alphabetically cppcheck report entries when producing the text
> report, this will help comparing different reports and will group
> together findings from the same file.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  xen/scripts/xen_analysis/cppcheck_report_utils.py | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/xen/scripts/xen_analysis/cppcheck_report_utils.py b/xen/scripts/xen_analysis/cppcheck_report_utils.py
> index 02440aefdfec..f02166ed9d19 100644
> --- a/xen/scripts/xen_analysis/cppcheck_report_utils.py
> +++ b/xen/scripts/xen_analysis/cppcheck_report_utils.py
> @@ -104,6 +104,8 @@ def cppcheck_merge_txt_fragments(fragments_list, out_txt_file, strip_paths):
>                  for path in strip_paths:
>                      text_report_content[i] = text_report_content[i].replace(
>                                                                  path + "/", "")
> +            # sort alphabetically the entries
> +            text_report_content.sort()
>              # Write the final text report
>              outfile.writelines(text_report_content)
>      except OSError as e:
> --
> 2.17.1
> 
> 

Having the report sorted is certainly a good idea. I am just thinking whether it should be done
per file or per finding (e.g. rule). When fixing MISRA issues, best approach is to try to fix all
the issues for a given rule (i.e. a series fixing one rule) rather than all the issues in a file
from different rules. Having a report sorted per finding would make this process easier. We could
add a custom key to sort function to take the second element (after splitting with ':' separator)
which is the name of the finding to achieve this goal. Let me know your thoughts.

~Michal

