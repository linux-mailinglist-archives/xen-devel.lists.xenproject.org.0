Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B017B62170D
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 15:43:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440082.694139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osPoQ-0002Nx-Sn; Tue, 08 Nov 2022 14:42:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440082.694139; Tue, 08 Nov 2022 14:42:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osPoQ-0002M9-Pr; Tue, 08 Nov 2022 14:42:50 +0000
Received: by outflank-mailman (input) for mailman id 440082;
 Tue, 08 Nov 2022 14:42:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zz3j=3I=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1osPoO-0002M3-Tr
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 14:42:49 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2065.outbound.protection.outlook.com [40.107.96.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bb95432-5f73-11ed-91b5-6bf2151ebd3b;
 Tue, 08 Nov 2022 15:42:46 +0100 (CET)
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) by
 CY5PR12MB6369.namprd12.prod.outlook.com (2603:10b6:930:21::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.27; Tue, 8 Nov 2022 14:42:43 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::ec49:f96d:d3f2:79d1]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::ec49:f96d:d3f2:79d1%4]) with mapi id 15.20.5791.020; Tue, 8 Nov 2022
 14:42:43 +0000
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
X-Inumbo-ID: 9bb95432-5f73-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4wat7lqezk2gnsewENtOfr/96sas50U2lLd5HKifP1VaTxQYduTIK63FefKy5dnkzNL4IBx+B8LHydJSRGpPzsMk850HRZ5/KMCdz7FKctCkK6r/Tv2Bbd1QCMQYVZCTmhWCkfXS5glTbJGORwlbbC6HH9GpsyHkCbfkg5Tqc37ZOjVKtR2B7UiXvc8ExtUAA8AGNfTNHpS0BC9VVcdrBHsG6a4LZur9KGzsrBcYn3NT+IO2oCx1CE3veZC+x4+IDEVWln8r1yx7vk0LGvzpuLLh0vn/yEZAcCxHDBdlgW2JgmjPaU/8che4HX5XD1om5imLFGYCJnxbL5DgoONlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0iC+xgTwyJpa4vtqYp9BNPcs9ycHF7WATSo5vet+Sk=;
 b=S27ZX+QxQof7EowgHjKnm1hrDV2zJ/n9tYF1pj1Lj2saiUQSKuEdPQm683co1mRKKGWTp5f/w7M5yMCIULvPHVPMD/f73IqPW4Z67BX8a4cIB6hSqPZFiHS9hHq9Nd3cMPBLk/NGWy5wFzO1G6TSKECTSMqrk6U5U0evdcubpARNS5fqClhkyBJkHBpLH0jlSt6Tne7YY0ORcEaAn+3D6lL86fy9CYM08XFUve65NGrdRtyWyPA5nhEsaDX+MllRuBjImD8BGCEmahZRWOQCnF7D6rcH8jQ98Fsg8hZHpULHBvnT6GLzooBdMD6/dXZ9aUJ0pBHyNhrOkin6zbLnQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0iC+xgTwyJpa4vtqYp9BNPcs9ycHF7WATSo5vet+Sk=;
 b=ExSspsvMXcsdBEfhM/9qF17hVUiCqlsoiAKCLU7C7xVyNRMysiAmXwJsXjjtADT3UPBGyqEcZmiPu6IbA+tBhLBJCQI6HoplSe53Rr4v37Q6d00yOlhAnNZvRrtLFUk106LuY2rWaB8EVKLHcW01mQibXa7txPKgnY0szfuS1WA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Tue, 8 Nov 2022 22:42:24 +0800
From: Huang Rui <ray.huang@amd.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Henry.Wang@arm.com" <Henry.Wang@arm.com>,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.17?] x86/pvh: report ACPI VFCT table to dom0 if
 present
Message-ID: <Y2pq0BNNVr5gVucM@amd.com>
References: <20221108135516.62775-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221108135516.62775-1-roger.pau@citrix.com>
X-ClientProxiedBy: TY2PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:404:a6::18) To DM5PR12MB2504.namprd12.prod.outlook.com
 (2603:10b6:4:b5::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB2504:EE_|CY5PR12MB6369:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e390c5b-0122-4951-1dcb-08dac1977e71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uIFBPcTCAasF0QusHnxvYJR1iWCreWp9XyGBV1ekNkzxmlhNHUHSRkrkCF4GHztY/Ctrsnfsebbtmlj79/0FHsgPg527wZq15spbeJxDE7GcUU1VQ03BiI3o6W0UXr1oeRLHQqW7sld7U59r4lMlNcUU7AHaIlgjeTeyEiaPHL6tVGAyQgS+hvDbsI9Usn2rQTO5j59PHKiSV5mzuUXeDWuqkDK7D/tX8nLjPJe5mB6XbSrOj6x64Pp2MtwPiIsMVU75JvnxfjOJ1sD7ir7eaEaieWoMFQ4XIOLuS6MwyxtV6HjtRZEtuBXZgMLr0Gc9nlunpGXtqUdCPCmarqLCIkF3y5ceXCwPS7QwViYEmnH+PJHRckgPnRkgOXwkQFByDzbvZfUYehXYCSx94XnDKBYneUhCy70rYY3YYqxiyBbTPtK5+oBLnZsfnC5m9LjSbme7GYcnt3cFILhx8qLTAfT5qSWvamtAinnMeSi1idl8F1fomErYtPMfXa7ONfkA4RwtfUPbrS2PHAoIACloDsupGEtmPRCo3URwQoc36iwPeN7ZcPWzhAZqYp40eLmQJdpuAJXphRpEwPFh1ypI5VnPhRQdGVVOUxKE5XVyp9/2ftCKvvRMnwyLVP+TCdkNzAmT/rhxpQWZFkYk84krFb3ASYlP6frkDiBy7B/FO/MoO7xPyNLgjNC7YU6eoWFn/xty221j58MUM/ijLYTOTw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2504.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(39860400002)(346002)(366004)(451199015)(36756003)(83380400001)(52230400001)(186003)(6506007)(2616005)(6666004)(6512007)(26005)(38100700002)(2906002)(5660300002)(86362001)(316002)(45080400002)(6916009)(54906003)(478600001)(6486002)(41300700001)(66556008)(8676002)(66476007)(66946007)(8936002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?3lfHuXCzDClQV75AoR9KoJWVOOuVbcZhmNlcEaBXXNqlj1MbS/2oDL3CqV?=
 =?iso-8859-1?Q?aOfi1FNNiMWdTgVbOqXbOldTo9DBkxyY5YCSmnb9nAvbM9kasn8ukj2lRE?=
 =?iso-8859-1?Q?qBnqcYIdCIa2wcfR6gohr/bC4B3LO2SpsQcQ2mnACDUw9CXwVUMFnueJXR?=
 =?iso-8859-1?Q?IsShWAV8jCyRTKiqIH1E3t7io299IzhhvZ0mRAk6W1ydMqIxi0d0WCVBUs?=
 =?iso-8859-1?Q?YMJNZ4hEsfvDIXXxVV/cLCI4ZNBUjfNREYJS5QRp5M9QLLMd2CL0RQ/2b8?=
 =?iso-8859-1?Q?VmM+WeQ/EAqAHWegfvU0ROQZ5fcloYRKZX5G/AlGKuLkLwZ5j1RSa88fSv?=
 =?iso-8859-1?Q?a1kT2J6peHuH3oatf12p6xZsJcXJop6Ftiz8ezPyO/cQHstyGrVrAgDMeu?=
 =?iso-8859-1?Q?GCThtgaF82Bu6Uw5DUyMkYPK/NAF8VC4zkVdJDg1VIYiAhT/tu9z7DuWaq?=
 =?iso-8859-1?Q?D1PC0ww9AYc+HPPFOwiHTdleVO8rW8facwJ+NETV47tmRP7trTQwmvCILS?=
 =?iso-8859-1?Q?97DmLSkNS4e+tGktIXqsIglhCFyva4AfLrlF6XZOXtNicjY2WD8YfpvFEO?=
 =?iso-8859-1?Q?f2R7Ahv29W21FdZIbaz4jrA9Rl/ZxVrpTUtZ89eelFKOq9fXBLGZ4FZjhd?=
 =?iso-8859-1?Q?vNXH1zWug/xGsw4X6MWuNfGnCxLDJalvftwVSjIYZJNy15DkmOcpJJ/eny?=
 =?iso-8859-1?Q?XlLJ5m171TljHhlCBEilq1ylHcw6JkvLFyRTsJzoYEGJaGQrwxUuwy7L2S?=
 =?iso-8859-1?Q?7RveVx0BZ/R004KqFMEn1bnCgY6dtUD8S5sQissRrCLn9Xrl0l+QTMu4gZ?=
 =?iso-8859-1?Q?BiiFWTC3K8HR7imbvKzQgqBwHTQKH7bjUDdiK3YeMKYxJAxTnS9eZPcZ8C?=
 =?iso-8859-1?Q?A83JWP9roI13EotIRD7mMqjL/TbRrJehuRWAzwvV1tLg78L2geFt9hrUdD?=
 =?iso-8859-1?Q?edW38b5U1/v8bJlbp5SWc7oxIj5QD3xFTL3P1jgsTGhBL8yWBuFyUqCAq6?=
 =?iso-8859-1?Q?TBSnytjCSdZ+/bqnaWJpFap1oLQ8W1qZQMZsFGfaclYpuCvvFTFoRaHA8g?=
 =?iso-8859-1?Q?NvXc3LFgHHce9NyHnzHzWYV0aEGj78NEtkG9OMjBT63l29t0MAIPtLjqiG?=
 =?iso-8859-1?Q?3a2qXoRyn1EBCU4CWOL9BdPlRSh5uRkiaCKQR6bRtRi/fDC4/deOnLaSfG?=
 =?iso-8859-1?Q?tfNZ1MHiGU/+DxJRMa+6FlZyIThOFTKZ/zCtO/awpkTG/+MJrnp/GCKfse?=
 =?iso-8859-1?Q?MMTl9r4oclrLHJJmTLVCEo7NVCIkFHvgGrJynap0FfImj6qXmtOEEy+mO/?=
 =?iso-8859-1?Q?ISTmfPIcpBG1NtHNX0Zh0KjTx0eUelz7uK5rALG3xxP+CbBqzQoRmq4qj4?=
 =?iso-8859-1?Q?nZozLBlWjbGRTNNluvqCzG2tRkqKGxet+ihvqdrREhhm1LQC7zOeeJnNq/?=
 =?iso-8859-1?Q?WmgHpxXUhhqnfLUNL8GCdrPKWmqFZhhXdWpdlJ2qoQeiDrokTwy+XJoAhs?=
 =?iso-8859-1?Q?1t8LTzJvu0yFvsUrotF9t0kzzLQM1PcFkcKoc/q8JBAMLhtMEG1vmNtt6l?=
 =?iso-8859-1?Q?L6OpQ+5A05tPjMNWApKWijIii9NlK1TvzkCYG9TSMZbVFXDsQbIOS8LbKk?=
 =?iso-8859-1?Q?lyZ+fWZCTQXG/W0EsBq+NpmySxIw0nwPqH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e390c5b-0122-4951-1dcb-08dac1977e71
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 14:42:43.3630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sOyUTZ2nIbcguV5HQjnQ0kCVywvBd5K2/ZSEW6csUmkuDv2M0QtFhsyLby3P0hakKEgXnbOyvkkorrl+Zcw4CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6369

On Tue, Nov 08, 2022 at 09:55:16PM +0800, Roger Pau Monne wrote:
> The VFCT ACPI table is used by AMD GPUs to expose the vbios ROM image
> from the firmware instead of doing it on the PCI ROM on the physical
> device.
> 
> As such, this needs to be available for PVH dom0 to access, or else
> the GPU won't work.
> 
> Reported-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> This is a bugfix, but given PVH dom0 is still experimental I'm not
> sure it would qualify for the release.  OTOH being experimental means
> there are no guarantees it will work, so the change is unlikely to
> make this any worse.


Yes, thanks Roger! AMD GPU needs a Video BIOS which needs to do the
initialization for hardware. We use ACPI VFCT table to expose the VBIOS rom
image even on the Xen PVH dom0, so we need to add the related signature in
Xen as well.

Acked-and-Tested-by: Huang Rui <ray.huang@amd.com>

> ---
>  xen/arch/x86/hvm/dom0_build.c | 1 +
>  xen/include/acpi/actbl3.h     | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> index 1864d048a1..307edc6a8c 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -924,6 +924,7 @@ static bool __init pvh_acpi_table_allowed(const char *sig,
>          ACPI_SIG_DSDT, ACPI_SIG_FADT, ACPI_SIG_FACS, ACPI_SIG_PSDT,
>          ACPI_SIG_SSDT, ACPI_SIG_SBST, ACPI_SIG_MCFG, ACPI_SIG_SLIC,
>          ACPI_SIG_MSDM, ACPI_SIG_WDAT, ACPI_SIG_FPDT, ACPI_SIG_S3PT,
> +        ACPI_SIG_VFCT,
>      };
>      unsigned int i;
>  
> diff --git a/xen/include/acpi/actbl3.h b/xen/include/acpi/actbl3.h
> index 0a6778421f..6858d3e60f 100644
> --- a/xen/include/acpi/actbl3.h
> +++ b/xen/include/acpi/actbl3.h
> @@ -79,6 +79,7 @@
>  #define ACPI_SIG_MATR           "MATR"	/* Memory Address Translation Table */
>  #define ACPI_SIG_MSDM           "MSDM"	/* Microsoft Data Management Table */
>  #define ACPI_SIG_WPBT           "WPBT"	/* Windows Platform Binary Table */
> +#define ACPI_SIG_VFCT           "VFCT"	/* AMD Video BIOS */
>  
>  /*
>   * All tables must be byte-packed to match the ACPI specification, since
> -- 
> 2.37.3
> 

