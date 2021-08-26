Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 386C33F88BB
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 15:24:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173062.315785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJFMe-0004f0-Qn; Thu, 26 Aug 2021 13:24:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173062.315785; Thu, 26 Aug 2021 13:24:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJFMe-0004cC-MD; Thu, 26 Aug 2021 13:24:16 +0000
Received: by outflank-mailman (input) for mailman id 173062;
 Thu, 26 Aug 2021 13:24:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q24O=NR=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mJFMc-0004c4-Jh
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 13:24:14 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e6ea772a-0670-11ec-aa01-12813bfff9fa;
 Thu, 26 Aug 2021 13:24:12 +0000 (UTC)
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
X-Inumbo-ID: e6ea772a-0670-11ec-aa01-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629984253;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hAFR7Nq5ROmhOU8Q+idajTrgbrV8JymWDpA2BKVmVjY=;
  b=KyQadtzyqJu2NtprgxjM38mpqmW3TYwT7FjurWg0LUVgvgBZuGF671EI
   Vf4JeWGJU5Sh46Islw+wmxCJiQ22VVMX0OR/Ppg8R54nj1bpj+j6ouQFd
   ibJQCTbqHWfPfhZl1S0eVoopu6FuZxEx21MW7d2V+sduaJ28ElNom2D4X
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ZcjzxEOmssStl9hjzjA7avjt77X1aLCb4QC1j3DgCGUL92oE+Qf1rf7im3DkRaiUmEOIRc3pPi
 Rcv5pz5HeFSkXfQ4Z9HaX3RPtbA2ml+iicp9C5ud60wIAxJz0j2R+FAl5o0K36LYd2WHygj8Nz
 WFE6gqk/FvHmyFq/p3YMdrRzdfnAhY8PoXU+Qd7dYoZVygpDZ0XocDbqX59/3Lv2YjiKSm3VSm
 LHgAhsiVN+nW7qsNM2N9oEe/dJWBKJ4LOTQZhjUUokmhtWzIRJtuNFeY9G2VOt7vlcHJ1phWVI
 jYZUqCUeCcXFfeS5/toUZGhq
X-SBRS: 5.1
X-MesageID: 51367777
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:bFlkZq9Fu27QGOi9tqtuk+DoI+orL9Y04lQ7vn2ZLiY4TiX4ra
 +TdZEgviMc5wx+ZJhNo7G90cu7MBDhHO9OgbX5VI3KNGOKhILPFvAG0WKI+UyDJ8SRzJ866Y
 5QN4R4Fd3sHRxboK/BkXCF+g8bsb26GXaT9IDj80s=
X-IronPort-AV: E=Sophos;i="5.84,353,1620705600"; 
   d="scan'208";a="51367777"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dg3IRAneYPm515NqXe+KEsg1hF0JY/vD/OH8ar1EMRGb2/rtoT6Aan983XQEEX/GpQf+Veg/BjHlIZTpCyUwF794+R4bsBVz7UxP4AhTRt32hEgp8K+VQwIoSHrbrmDcUa3wncg6pkTmA8JN12DSbwKrBZ1wGjooUh4b4R22EilKB1W6UD4TjT9JCAQMZDiwggDqpZud5Sn4k6+xblcT7IVK/DdQhlADHyD6vnA6IxEgCSX09rim33xG0b4RmBrt4pOywkuPsEhQYm1akqcFLPgVBa/ro6lt8Xh6+PlPZnoHanJdQu7F1DSJkcvJydh9ysNvLnoWWvehSj/DcMJfYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZeJkFxSlzPeDM7f7FnTgprzWkvtBwvtmqGpMRyUuHQ=;
 b=nbOLPApdwUK1X8mZ0hq2ZteGzAVgDIwEia9BgcvtXir6xjDCjdukVPOYBu8UzmwhBorb8CV/gwlGI59huDo9Dd9z/kO1DrKcNP5oIyVw3bEOE/qwTFsGVGSBrIViyAv4CN5WpxKM2tGRayByoHN5B5idHLtIRlaQFOOEJpqMPymFht17IAXeS3ZIn3UTjQvjv/oJd5giYYnjzlaRewCxsFwICrLkUWi9Gqg3QlkjNqPEhw7iwVfPNP3I0FnBNkZtKluLVWjCeTyFCN4zHi9ZvnuNwWCBn7HbbxZWby1j+HT1JecRgaqbHXqC7P6/Lzv7TkZbs+Y9MZSdwiCH1V7LQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZeJkFxSlzPeDM7f7FnTgprzWkvtBwvtmqGpMRyUuHQ=;
 b=iXn2mKjT3KIq7o0pp703QxpzonZnidzT422xrJhgpmfdSYHy173AP8Zw10KXFf5yFAx+8Van2kRXoMMeg6pThL4g9e6GZNpmBDXYefOHpez+KFBkFCAXhun7HWtVKxDThCxvSPlOwqDuK0uMUY/gy2wMz9t9hn7vHooTs7THdvw=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>
References: <bf4b3be9-1274-9750-7340-08b29dcecfd3@suse.com>
 <93f33c54-8abe-4a73-3597-2f7d00d2f4af@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v7 6/8] AMD/IOMMU: provide function backing
 XENMEM_reserved_device_memory_map
Message-ID: <9c682319-0db4-1536-9a82-b7d5250ead52@citrix.com>
Date: Thu, 26 Aug 2021 14:24:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <93f33c54-8abe-4a73-3597-2f7d00d2f4af@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0224.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b8421cf-fc99-4920-262e-08d96894c855
X-MS-TrafficTypeDiagnostic: BYAPR03MB3944:
X-Microsoft-Antispam-PRVS: <BYAPR03MB39447C7A3E25786F7C1922D5BAC79@BYAPR03MB3944.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Eke50WXuNTvc5Vg2+ew7CKe/vz7GPAPYGDpZ0MgdJhIyAHZI7JMjb9Xn3HkwTzavBBwK/33k/VEwltXSuWxh2fp+j9zJ7w2+JhRbz1QSTk6HES7NZAUvywy6tHvwc2LcSU5gDpM7A2vNEYfV0Yg4hWoYkQUjwnLNFMXTayYI5kB+HK4ZA/ceHAhlY3anVf/N8uVcSH23imVow1pOp7VANOKztB27FTfl8YQMKKukAK3xAO12Q0ZqCE3t6TV1rO717QrhlJ3ek/BBmpr/Kp2AqhDA9wAEtX+rwH1zo1722ev0Xi0F7vwMEKewTzCFI1gjsF24dHgy1hzdeevVQ5ZlqIWZxx4P0GOGAph0h6KJ5fbxpL9JPCB6323E3S3AqiuG6VArxqyxfZGWSpujqejFwyXPJPmqX2a51yCvvII+QxtDc4E0WGzKJHOFuBXqkLLw3EqRL8VFDmpHFvkEcUgGVhXYbxva+nedYQuU1A8A5Ssp//EOCX64vnIWGzmsPu1Groee0jx/8UHabO8bJPtew+jLJ2QqaRDMrvIiZ7v0eT19J4OBO8sd0+/omQdQ53/NNso2W5PtWbPiG9PPgIydnOr36nl/XKyj1Mw79WVnQFCt+GysdIg/XoVFiR3RQYpE9JUG7hDLlZWKg7bZPOiMB3EFQZW84/eJnesQpjcwTEsC77B83EGfQZfR9SlkB0BKdL2b6LIKhjO+X1sv+ylVimssZ2N2ff5GNOg5Kbj8xaOz6bNTAGHT7PeAQOsrx3r3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(55236004)(53546011)(6666004)(2616005)(956004)(31696002)(86362001)(26005)(2906002)(31686004)(4744005)(508600001)(4326008)(8936002)(110136005)(6486002)(316002)(16576012)(66946007)(38100700002)(66476007)(5660300002)(186003)(36756003)(66556008)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDg5cXQxYXVZRjB0TG1qdUpFOUIzQkZ0cDZ0RFc2eHMzcjFTbGFxZ0hSS0N6?=
 =?utf-8?B?N21YdUp3cXJsNkN6eXZTUkhCbnRBSDM5Ym4wSzZ3VzlHQ241Ri90cWhHQTZN?=
 =?utf-8?B?QWJERml3VFZPcWxEdmdDWmErcmliMTI4emZCdzJMTlYvTEptTDIxa0NXTVRI?=
 =?utf-8?B?dkcrOC9URGFBYzV1S2VWbXdTWDJWQ28wd05ZU1lQWXo5dkRESGc4cDQ4OTNt?=
 =?utf-8?B?aU9KcTVCVlpTQWlmcUdTRWJCNVFOcStTWnlMekl0U01STEg1QkhKS2Fiak9q?=
 =?utf-8?B?U0NseExmZlhTQ1pGMGhiaE1Xa1ZQVVplUVQzV2prTHlDMlNIcXJQdC9JbFZu?=
 =?utf-8?B?U0NMRUc4WjVlY3dSQXRPZVppQUt6emVUM29BSldkNktMSkgvYW53bWVibkox?=
 =?utf-8?B?Z0JrRHphM1hjZU9IUnYzTTRtNHNYNFhFR1lyTDB1c0JMc3VLODEyVEViUXZm?=
 =?utf-8?B?R0Y2eVNVN05TSlFqQXp6YzFkZ0JxOGZYWUVqQkFFd3JteGFtd0tpS2QyWXlZ?=
 =?utf-8?B?YjRFN1ZDZjgyT1JXZE83dFJrS25Ba1ExeU5mSVdYSTJKNFQyd3dHZWZZdE5P?=
 =?utf-8?B?bnVlYVRoc0xWWHdHUXIyYzM0a2VPM2hmYVc3WlNtYTdwZzFVbVpJd21hcCtI?=
 =?utf-8?B?QWFyWEVYa3VCV3kxQmFQa084cHQwYlRGYlVUZEtxTnVRd2V5QW4yU2RQenlF?=
 =?utf-8?B?c21Nbm9tSzdKTXFOTkJhbEgwV3ZWbjdaM3hTSlUvejVNY3l6VkdQYnlHYnFH?=
 =?utf-8?B?eTIwazIrK3VTajUrK0ZiSUtGU0RHcUplYWJIQ3RUZHE3Q2Z0aFJIM1ZTbDM2?=
 =?utf-8?B?SU84d0dIYWNnbWYrUkk1TGk0SE9uNnd4am45bFNQQmpNTTRrc1BQY20xazJq?=
 =?utf-8?B?aWlDUXVmV3pXSEthWHl2WFRJQ2JEZmRLa2tTVlRZdWVmdHlPSUtwaFlGTFBC?=
 =?utf-8?B?cWNSVWpVWjZkdnhjd1hqTnBOMnpNS0ZrMEI4amw5ZHhzcEhvQ0h5REU0YkI2?=
 =?utf-8?B?UW4xUnBic25rbGplY2gya0dJQXVKeVliWExROG41Z3NSSzRDUDVRWFFLSDYy?=
 =?utf-8?B?MVI0b1ZaVHRDTVRmRS9yYVFCaFIrZnk5dURMNmRwT2tWUU84UGdKaC81YVRV?=
 =?utf-8?B?K2xEM2F6bnJxVERxcDlZcERGSldFbEFGajlodHoySExZN1hxVDJiSnpXdldF?=
 =?utf-8?B?TUpOTUZVNkI3Tkk2NUNmMTlRNzMxQ2ROU2RKU2lBaSs0VitQZURKVnBTUjRX?=
 =?utf-8?B?RDI5OWwvRHBQOHoyMkZxaUlMY2Z5dTZCOVRTb1VjSUhXZFlBV2JJc3J2NklJ?=
 =?utf-8?B?NmFqK0R4WVNsUWVlU2xnMElxZWRXa2lhbGxWZjZmQVlvblc5SFBRT2gwMmox?=
 =?utf-8?B?OWV3WTBvcW51YWRQK2RrTjZLM1huUEVPQ0Y5bjd6YVh4bjlpWmd4S3ZHK0I5?=
 =?utf-8?B?aTV3VmVDUnAxS1M3MVFyRmJ1RE9yeHBtU2FkTGQzWHE1Wm1aV0JmTHJWOSt2?=
 =?utf-8?B?MlhuZmtiV3NZVnJ6dVNzVGpCbEV5OHF0MlhCVmw0b0EzeUxmRlk2aUhJSE4v?=
 =?utf-8?B?ZGt5b2s2UC82UWlQUlg2dWkxWm5xN29KS2pJWDR2dG9VMW0vUTQ1ZW96ODdE?=
 =?utf-8?B?cVJ2R2tSOFRsMFpoT2p3SHRXVXYwTjI0eStjTGFvTitaeUF4a0VjV29uWDNp?=
 =?utf-8?B?a0FiK0EvMWc1WVhnN204ZXRWWk1xQS80T0l5a1E5b0pOUkNJR21BSkU0QVlj?=
 =?utf-8?Q?da/YqrwYvFkn/7Sj8nqHnFLjSIbczOnvWQQD1Wm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b8421cf-fc99-4920-262e-08d96894c855
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 13:24:07.6507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZzasevbMlPx5saogtRiCShLmo2ayOTDbCx421Fz4gWDpmQkgQChUj/EH8izAKWqgswEZckF1u2b20EpqL0ShDimdGjcUFBLarB9t1Lgww0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3944
X-OriginatorOrg: citrix.com

On 26/08/2021 08:25, Jan Beulich wrote:
> --- a/xen/drivers/passthrough/amd/iommu_map.c
> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> @@ -467,6 +467,81 @@ int amd_iommu_reserve_domain_unity_unmap
>      return rc;
>  }
> =20
> +int amd_iommu_get_reserved_device_memory(iommu_grdm_t *func, void *ctxt)
> +{
> +    unsigned int seg =3D 0 /* XXX */, bdf;

Is this XXX intended to stay?

I can't say I'm fussed about multi-segment handling, given the absence
of support on any hardware I've ever encountered.

~Andrew


