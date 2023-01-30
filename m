Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6499B680BCB
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 12:23:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486905.754320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMSFk-0005OQ-Cu; Mon, 30 Jan 2023 11:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486905.754320; Mon, 30 Jan 2023 11:23:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMSFk-0005MJ-8X; Mon, 30 Jan 2023 11:23:12 +0000
Received: by outflank-mailman (input) for mailman id 486905;
 Mon, 30 Jan 2023 11:23:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6cZ7=53=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pMSFi-0005MD-CE
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 11:23:10 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e89::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76926e86-a090-11ed-b8d1-410ff93cb8f0;
 Mon, 30 Jan 2023 12:23:06 +0100 (CET)
Received: from BN0PR02CA0057.namprd02.prod.outlook.com (2603:10b6:408:e5::32)
 by SN7PR12MB7979.namprd12.prod.outlook.com (2603:10b6:806:32a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 11:23:02 +0000
Received: from BN8NAM11FT077.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e5:cafe::53) by BN0PR02CA0057.outlook.office365.com
 (2603:10b6:408:e5::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36 via Frontend
 Transport; Mon, 30 Jan 2023 11:23:02 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT077.mail.protection.outlook.com (10.13.177.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.21 via Frontend Transport; Mon, 30 Jan 2023 11:23:02 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 30 Jan
 2023 05:23:01 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 30 Jan 2023 05:22:59 -0600
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
X-Inumbo-ID: 76926e86-a090-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eW0hmAfFfz2i8/UhMpX0H4u6l2AMI6aUH8FttPyBHpH9W1/Vs3nG9X3tYSbAVJhpnhKAF4oOjUdLCG9ObM46+rXFFnknMSTn2ZZ3wl93wXc2jbt3/i2CU+bowKs2krnCbFdMdljxX+BJDZq2oJhU5dKMcbiON7b+HBd0GvJzjIAB7HiGI/Xk6uZTHyf24Tm50jcMqdIU0pZ3BjgVu0Te/X0WLf7MyU8lnC31HcRs1sG6ZUyx4NHYvFv21zIe8t4sZ/hJjwvMEAiJZWpjEBOI15YmVa0WkHvZNQBnsNySI59zBy37dzIIsLBuxBko8iTnWLovc8rFuZkcRlDM89AY3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z13DJ4/lWshBGiGNlBJ7mHuqI3xxp6AcbqjVpPJrQGU=;
 b=j2OGSWxmlhU6QGBSBS087IGubv2p5yQxCwlb52SbplOHYttUAaywbA5gySX3/cFLYXkbYN+tNzoM2bvhGDxVoT6d6CXise+obSlKfb2SJw04NMmwVOdhPOUeZGKysdfcG4aNn1ah9I0xYFAqak+c+fJ4KvmGKjijM6/N5CKDLCmiam8CmN5JfplThHZO8CAzkqqwiePzf07jKGOpwV5uDjPrrumwAnK8XPUi9uE58zd8p2Jb5lXTnC6eRmyQhtG5gH8rW0wgBrsK1gJNCNQwM++j1tH85H1hMCtikaM+Y1MFAb4h3lCy6FIDzyK79bEpxfKsDmU8J6k9gpmJ0JKNLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z13DJ4/lWshBGiGNlBJ7mHuqI3xxp6AcbqjVpPJrQGU=;
 b=tUiYOdWp5RMu2fxI6NMb7jvAds2I1siuuKEqpnczPUiauonJJ9F3G7xIlPPJUnDRUFqBP/dpLHm+EQFJfD9aCyeNmjTIEFkT5rkMIGfeYszU1cF3W0RsvFaRUYBXtbrcg8FZj5Hu4CuU4vFprfYPvlSA8/2p2RUh4W+H9zz6tJw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b24bd369-680f-45ac-2ce6-d8cad582eecc@amd.com>
Date: Mon, 30 Jan 2023 12:22:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/2] xen/cppcheck: sort alphabetically cppcheck report
 entries
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: <bertrand.marquis@arm.com>, <wei.chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230130110132.2774782-1-luca.fancellu@arm.com>
 <20230130110132.2774782-2-luca.fancellu@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230130110132.2774782-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT077:EE_|SN7PR12MB7979:EE_
X-MS-Office365-Filtering-Correlation-Id: b753f28d-b0f4-4ef1-229c-08db02b45976
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C1Sl4kHGE6yXjUAT8Zg4ViZebTW8WhNhADriQBGQJFM/uQS0gaj/DYmb4nqUwmCSf4tMLOy+BhUy9QzsHKvRo6OOOmLFUAl9dmjw7SLXXBA9XFarjj1Q/TJk+Rf/4dJciBTZvAmP8Y4c8vLes04XnxmlxnO0ERLNa8v/b1XTf6UCuPapDE7LAsBiRwM3hWKiB3Zqwq6Xr/gC62WrzBy7kWYN8DCokw2IXUXs0cdN3pyDvyfVsh2lsI9GVldRQgIw7Tg4IRIJ4rTzUrsVdpc72PP2Zr+VGfCVyUDhQzX174S3KXh8tDr2d6DDpx/jHrINLy/5hh97tmyUh8rof/lO+k7+b6sGJDzX+uNYcDq35ztt6YL8itMJJ1IsRca30r5ef0P+Cbk+JsCFx9e6QRluObBS9CPfUT7h/NeyuKVcO0u+7J1WsC4UikbFrt2II1FRzgQH+E8iW/s0bcilQs8d73xhnGcLMIWQIGKYlfhI2UcaxZnB2uMHfB+59Uc2oqzdv/3AM7Mt/G37+qo78GdGCL//vFr3d2yggTWs0uGh5XOpQ7e3nryFGfoHCtt8BWshvzfSpgE6bmLd239Hd+k0KoxTYkRSLgHQNrg85XYKlk/t6LxxFHD/lyLYHz2KBIMElTuuFSG1XxCCKi88lKeGuRQoW7SjHcSsJyAl3CcIqmvOokOIWFxy7EwxR58TfnBHn37y9fkYBcXaTgXY0ys4h1XT+EtpJdG6qC/h6dfPNk7+72X8iFU0kmqF/b8V618SyszGiWu57wMvGfZ1BBAXEg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199018)(46966006)(40470700004)(36840700001)(44832011)(7416002)(86362001)(2616005)(426003)(31696002)(336012)(47076005)(82740400003)(82310400005)(356005)(81166007)(2906002)(40460700003)(36756003)(36860700001)(53546011)(26005)(186003)(478600001)(40480700001)(6666004)(110136005)(8676002)(8936002)(41300700001)(4326008)(31686004)(54906003)(5660300002)(70206006)(70586007)(316002)(16576012)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 11:23:02.0871
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b753f28d-b0f4-4ef1-229c-08db02b45976
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT077.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7979

Hi Luca,

On 30/01/2023 12:01, Luca Fancellu wrote:
> 
> 
> Sort alphabetically cppcheck report entries when producing the text
> report, this will help comparing different reports and will group
> together findings from the same file.
> 
> The sort operation is performed with two criteria, the first one is
> sorting by misra rule, the second one is sorting by file.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Changes in v2:
>  - Sort with two criteria, first misra rule, second filename
>    (Michal, Jan)
> ---
> ---
>  xen/scripts/xen_analysis/cppcheck_report_utils.py | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/xen/scripts/xen_analysis/cppcheck_report_utils.py b/xen/scripts/xen_analysis/cppcheck_report_utils.py
> index 02440aefdfec..0b6cc72b9ac1 100644
> --- a/xen/scripts/xen_analysis/cppcheck_report_utils.py
> +++ b/xen/scripts/xen_analysis/cppcheck_report_utils.py
> @@ -104,6 +104,13 @@ def cppcheck_merge_txt_fragments(fragments_list, out_txt_file, strip_paths):
>                  for path in strip_paths:
>                      text_report_content[i] = text_report_content[i].replace(
>                                                                  path + "/", "")
> +                    # Split by : separator
> +                    text_report_content[i] = text_report_content[i].split(":")
This is where the for loop body ends so it should be separated from the rest by an empty line.

> +            # sort alphabetically for second field (misra rule) and as second
The second field is not necessary a "misra rule". It is just an error id (e.g. unreadVariable).
However this is just a python script and we use cppcheck mostly for MISRA so I do not object.
 
> +            # criteria for the first field (file name)
> +            text_report_content.sort(key = lambda x: (x[1], x[0]))
> +            # merge back with : separator
> +            text_report_content = [":".join(x) for x in text_report_content]
>              # Write the final text report
>              outfile.writelines(text_report_content)
>      except OSError as e:
> --
> 2.25.1
> 

With the first remark fixed (e.g. on commit),
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

