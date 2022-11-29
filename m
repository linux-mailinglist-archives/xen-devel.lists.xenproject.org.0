Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0E963C572
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 17:45:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449559.706392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p03jL-0006WW-74; Tue, 29 Nov 2022 16:45:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449559.706392; Tue, 29 Nov 2022 16:45:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p03jL-0006UK-3F; Tue, 29 Nov 2022 16:45:11 +0000
Received: by outflank-mailman (input) for mailman id 449559;
 Tue, 29 Nov 2022 16:45:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+/UE=35=citrix.com=prvs=3254d5a84=roger.pau@srs-se1.protection.inumbo.net>)
 id 1p03jJ-0006UC-Cd
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 16:45:09 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cddff23-7005-11ed-8fd2-01056ac49cbb;
 Tue, 29 Nov 2022 17:45:07 +0100 (CET)
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Nov 2022 11:45:03 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM6PR03MB5177.namprd03.prod.outlook.com (2603:10b6:5:22b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 16:45:01 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%9]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 16:45:00 +0000
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
X-Inumbo-ID: 2cddff23-7005-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669740307;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=rHiG1QXrJjEs6TI4JpojR7n91fraKAmeS1Qd7L8jACc=;
  b=DCz/3eMT1onfl+8WuxnnNb+9NwCCHkF2+ELYZrkgIbeVETqYSfO8ve92
   p9/o26b06wyAMJlx49++SuIlaJNayczFlFu3h/OGD/uLLVrj/Ydc+4TmG
   fwgwrzDvVzdwNldDo+VWlpx8SqVUzGHQvQXtVr1+deXpxfKtf2USfhSsY
   k=;
X-IronPort-RemoteIP: 104.47.55.100
X-IronPort-MID: 85798842
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:hyRiYKK+cBXxu0goFE+R9pQlxSXFcZb7ZxGr2PjKsXjdYENS0WBSx
 2sXUG+HO/rbYGb2f9p2b9/lpkoBvZTdzoRnSAFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5wZvPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5IBHNM7
 8xAJQwkdyCIiuWLm5S+eK5F05FLwMnDZOvzu1lG5BSAVbMDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dqpTGLlGSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iLx2b6fzX+hMG4UPLOc1MZAnHev/WhJUSdRZXSC+cKLh1HrDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvBGjhHoLCTD3WH+d+pQSiaPCEUKSoHenUCRA5cu937+thr1lTIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslRPuZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:KdqdTa00VrHx3ta5o+1VXAqjBdJxeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjkfZr5z+8M3WB3B8bYYOCGghrQEGgG1+ffKlLbexEWmtQttp
 uINpIOcuEYbmIK8voSgjPIdOrIqePvmM7IuQ6d9QYKcegDUdAd0+4TMHf+LqQZfnglOXJvf6
 Dsm/av6gDQD0g/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2jnC6l87nzFjmfx1M7XylUybkv3G
 DZm0ihj5/T+c2T+1v57Sv+/p5WkNzuxp9qA9GNsNEcLnHBmxulf4NoXpyFpXQQrPu04Fgnvd
 HQq1MLPth16VnWYmapyCGdkDXI4XIL0TvP2FWYiXzsrYjQQy87MdNIgcZ8fgHC40Qtkdlg2O
 YTtljp/6Z/PFflpmDQ9tLIXxZlmg6dpmcjq/caizh6XZEFYLFcgIQD9Ad+EYsGHgj99Ic7ed
 MeRf301bJzSxe3fnrZtm5gzJiFWWkyJA6PRgw4tsmcw1Ft7QVE5npd4PZasmYL9Zo7RZUBzf
 /DKL5UmLZHSdJTRb5hBc8aKPHHRFDlcFbpCia/MF7nHKYINzbmsJjs+og44+msZdgh0IYyop
 LcS1lV3FRCNH4GMff+nKGjzyq9A1lUBV/Wu4NjDtlCy/HBrYPQQGy+oAtEqbrknx0daverKc
 pbdqgmR8MLFlGeabqh7zeOJaW6FkNuIfH9muxLL25m8fi7XbHCh6j8TMv5AobLPHINZl7fa0
 FzLwQbYv8wo3yWZg==
X-IronPort-AV: E=Sophos;i="5.96,203,1665460800"; 
   d="scan'208";a="85798842"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TqDXVbOVKOa2nuwLfszkdm+JFhuhORgNkfwS4A8x+ZiumSMxkEy3Uq885Ef6EyvBAsFaCg3qP3+ys/J6QEWdwnv6Q+RtmVw/HDgvFHCpui5YCHWf/bM9L/0K4/FGrw50vo+Q5qgjnotPVy59Bv8OPl0+1bxsC5gH1/a+kPVKTjLsMjCOIDSKoEIzjFSAuPB6kMI2oQ8iUUWEFEKdDFhz9HdPYn6VRxeaNPXD6Csze/NBXrPB7pwVRcyN0cAgvCdVWWLg4ITj6ZsbSkzwz0WRzS3oILSp1odzau2FFvMLs1Ew4yf0MCOimFJP4htxya/2M95K+lU825ixYPH2Iu3FhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4IL8K7KB8uKCOf1ktcW//JXR37dQM3ALNhhjLMMZbY=;
 b=j80ilVhqZ6gXNDdm1ArA8K/2+lf+Ne6S7IA7lSci+UbPNIquGNiLCmRPbhwMVhXizXdRKM+ZV7sYjwk0d6EkGwSi+XYoRwGG4gXsnh1yiz4GzB5zHPAEHIKmYyvS+45k8vkDMdtar9pj3gVVrlF93JmftHj0nkcRIVBilB+GFWrVw7OqtwRL/l37WddpmAbQMjjMUmB2ohJitS5xaEeoOIUcJkijUN1JwDaiyAggY6FSDJKPHdZZIl2RnDXLFiD1ZALLuB6bTf3BWZ7EidhmayKsa1NSbdSpog7kxJCSglMLH4njRGjwm9qeMuf0XxGWIZ0bDks9rE4xczKrd4qUIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4IL8K7KB8uKCOf1ktcW//JXR37dQM3ALNhhjLMMZbY=;
 b=j+cmPgqbap4GXgdiQC//7TnRkPY7g6IF1TIV86QwoNhpZrV3X5jNmsu8LufouX1rWeUsy8Y220hnpnBB+UVWhqgpFXMrINfdmt2sOm4RJ6s7VeAyyAhoteZy1SnNmoTz/w6Hy/BwxKQTFGk7C537uM9jkLLGpkHFurYUhINlnzA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 29 Nov 2022 17:44:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] x86/p2m: don't calculate page owner twice in
 p2m_add_page()
Message-ID: <Y4Y3ByLHD4RaL5eA@Air-de-Roger>
References: <3876e026-2a98-b74e-2f49-4bed8fc0a224@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3876e026-2a98-b74e-2f49-4bed8fc0a224@suse.com>
X-ClientProxiedBy: LO2P265CA0489.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::14) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM6PR03MB5177:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f0d1ab0-3267-41de-3e2c-08dad2290e7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QGjDAdPm11qgyY0Gb9dPuLZED94ahHUKsOHtauaj7s4SWqNLIKwANtQ6BdoV4wleQt98G1wUkhG6bbutGpax+S4SqnglnS4eFC3aQl60YOQzTQA9f6+yKb5kLOMfhkicdzxf6FosMYUBUlNZ2BZM4XYmvPVFWeD+TmclEr+c6iR9p7QyKix8YHWR4LSCAFAcEXcSl208Ma0VL31M+qtjsIxKYGwKHjv0AhV0jRH34MJrwXkq55Z4i93L1lIc1POSfmewpqZ3UkyrRRw8hWMeqL/dZfNAqY6zOaYtry0c8Sf7WjcjruPhgq7DV9nFO95gLuvXthfmRsRTM4krDJyaAnWVH9Jd0arfDtAv+GUeOF5vmMcCMVJgCT8iGnhEjwiXMJmWmSFokxRhDXfcM2/6Cwul34jLGK/EwLvvcwCAnXMw4L/E/kz84iN+pzIf/kW4M/BWL792DaNtmQu3dBU3rtCQ8rMA/iD9LTdZmI1G6WWrBOj72faZfUcT2ziCj5yupM796dN+es9yAPX41dSiCtPuoXeDgGTFVW0skBwTZ8KiHzNf2Yo0ZoEj+uRcFkLeuqSstx2y94SVSMAZW0ZSYvVYO2VGBLEZAYaOKmFJc8H/qZW11skl5ykKSPZOaJmLqwlfCTuHSgAVsYTZRbg+YQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(451199015)(316002)(2906002)(478600001)(85182001)(6486002)(6916009)(54906003)(66946007)(6666004)(33716001)(83380400001)(82960400001)(38100700002)(107886003)(26005)(6506007)(86362001)(6512007)(9686003)(186003)(5660300002)(41300700001)(8936002)(8676002)(66556008)(66476007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?endzWENkdmNlcnZtMHB0QnNNTjhHYlFYQVVvQzN0a3lqcEsxQlM1N1NER3Rx?=
 =?utf-8?B?SjJ6eFZKbnoxN2dlZXFITnhNRHd5MEpyd2JuQmc3QkNnc0hOWnIyTHlQcmxL?=
 =?utf-8?B?Wk95RlFtMlNwZ0VlZlRRbVpPL041dlVrQVNSaDIxUEtMQktkc3hBb3FqcFgr?=
 =?utf-8?B?aEFWTHo5eGc4N3BhOXJlbFFubnA1UUpVZHNHd3Vmdm9pSmxVNG9mWlNzaG9m?=
 =?utf-8?B?dXNIRnF0ZWZkdVJvMFlxeHdoY2lNQ2I3WEpWcGNlbTR4dXNIRWFQV3plVUU0?=
 =?utf-8?B?c0t0RjhkYjJycVhRN3UyMXRPdi9WeklRaHNDTS9uYy9YbkFHb1hJejc2SXRq?=
 =?utf-8?B?ZUlzOEtVM1QrcHRhZ2w1dEI0V1VYam5RemFaQmdzZitLUVR2T0lQR1FKd3kx?=
 =?utf-8?B?YkZFWXhLamR5YVhXVllSVXZxVDBCU0VPQ0hTdThFZUNTazJVMlpTeXJhTTc5?=
 =?utf-8?B?ZnllWTlMVkVtSFNZaGRSYlcxcnFiWC9jZ3ZFQVJjWDZzWExxQStIdGlkbmxV?=
 =?utf-8?B?TU1ScEZVS2hjTkNUOEpqWHo3YnJCUXhocWRxcExXN2Q5dzcvZ1JwY3dVM1Fu?=
 =?utf-8?B?WTNENml3QW9VWkdTNzRoWEh6RHVFc0I0anFaWi8yVzk3bEUxRUkxbnVBeUZB?=
 =?utf-8?B?TDdtU0VCYmdZVS9nLytHVzJCRXdJYVpVYmt4VWFyUEpCQ2FkQU4vZnovN1lt?=
 =?utf-8?B?Z05aVUI2TDdkcVA1QVFJSmt1cFpZUTNFWm9NSjRNZFNxZm13eWQ4RnhwYWNS?=
 =?utf-8?B?cnlYbmZLcU9scHRZWkkyU3lRd3dKRVRyTHA5T3htR2QrVVFQNU94Y3h6TE44?=
 =?utf-8?B?QXl4aDF3dnBRWkhpalBKWTZwTVhUc2ZoWFNhNnFjTmsyWWx3cDZUOHIvdnJ5?=
 =?utf-8?B?TnpweFc0OXNOT3kva2RYSkhqYk9Gck10azFGam9FaWxYRTNZZ3dlbGhSOTR6?=
 =?utf-8?B?VVVSRjVDTW9iREFNTEhXTlBJTEtWVy9sWnhodmRWOEwvakZBYW1kMEJxWllu?=
 =?utf-8?B?djYyS3orQklKVjFqcVpuM3VWU2tFbXZVUlpYNXhseFNYZDgxM1pyYkZITVlU?=
 =?utf-8?B?MjhxMVlDL1dHcUxGUzMzUU1vaGxkRi9xRjdDMHJ5NWNqOG44bmEzQkZqa2R2?=
 =?utf-8?B?VDVsdjYvNENjUUFUY0FnVGVRNFZLaVNtVU9KNDVuVkJaenY1cWhFQUUxQlFS?=
 =?utf-8?B?OHpFNzFKZGxZekJQclFCdmlsOTBSTEdPenduMzdYbTRoTS9ZTFYrblBaR3NT?=
 =?utf-8?B?am5mZXFoNVUxQ0hjaEs0OCtqbTVVR0VxeUx0L2ZrcUVTU1ovaHFrQnl4aHVL?=
 =?utf-8?B?TnM1TFhORkVvZkZ1NFhNakRNTTBFbUVnYllWL2NoUFY3cW1KZHdmR0hRYnJ4?=
 =?utf-8?B?eUJpbTVEUjd4eEY1Ti8yRnl3NDMzKzVKN2hyWCsxK0tHcG1lajUzT1pQcGhZ?=
 =?utf-8?B?SENmZGcxblJoM3l2cmNCTENyWjBvNFJ5V1p4QTR6U3kwaU1wdmNXOVgyM3Rl?=
 =?utf-8?B?bkltdzNWaU11eCtCVVRtUjJrdEFyaDE5amlTd0g4WG56OEMreXpnSEdqTTF4?=
 =?utf-8?B?c1BqallSSms3eEhaYzJ6ZWlnODhyS2lFU0hoQnZzQlAzclhlVU1CTE9sclV1?=
 =?utf-8?B?SlNvVEtPVzg3dndNQzFBbWVNODRiMGpYVy9paXVWS3lyREJzUWpNbXdoVldY?=
 =?utf-8?B?WEwrNkROdFJDVmtHbG1NcGVqaTZNSEZTWTI5Um44NjhNalN5ekNzRmx3QnMy?=
 =?utf-8?B?Q28yMjE3NlkvSkx6NFYvRlhDWUZscy90cGo5RWpzL0d2aUs0aDZZY0dFbE04?=
 =?utf-8?B?LzhoQTlWSW1TUnlKNUgrRXlwT29xY3VndkdoN1JQbzl3SVlYejBxNjR3K3RZ?=
 =?utf-8?B?b1J4Y1FobVI5ZkkyOTdIeVpDQlZGekQ0L05vMG1UWVUyQjVsa3pJZklKcVpv?=
 =?utf-8?B?L0JQbnB4MkZXOVRsaUwxNm96bS9QUHNuRWdibmhSK1F4Vm0zR1ZzMzFCNzhD?=
 =?utf-8?B?YTM5Q0Rua2ZBNVE3UlJ6OUxyTWNCK2o5OGZreUhIYmRldW9oMTR3Nkx0SThK?=
 =?utf-8?B?Sjk2ZTRYaGNlQWRmTkpGYzBlakVPTUtWdmRNbGVNNXRjYTBjcjBCZTBUQkFI?=
 =?utf-8?Q?qR+JmIBt5jJDCEwpybEgHcX1J?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EOFjrnpaubvqQgSFe1u0SJahcDHzRJEwPnbGXw9b0VOBOtCN3qMejtWo0oi6LEi+B4spIP6Pj7QrtHgzrltrlU2/itnwbEH40vywy7+Epn4acR/XA76oeNUI2DxQlWeJ5HDHVXbz3TpAVXJIo7jY/StJRE6Ht14TNG6lrGtSONbtjg17q7wuW3D+1DMyhMKTylYl3K0ngHaH396rudzhzJyvgIM8f2Cqx1bMo7664bLaf9Mb7rKpXoAMMzEON0jj8xUDLaH/GqZbcWFn4ZPgvbtI0x5qWbhaA0OxqBHUjRVQzFwMSsGna0qbTRxJGDdw7e5y3UmV/rZwfZMyhkY8/9y0kso04XBNLkroCFzqAB+quH0Qhur/JwMfgW7BHHWNeN8FamhjHBGcTON8RE26Ou64Rzb1w6TghTXotn/QL3pKiz+OqTGw3+aUc/MWW1OP43P6e6lX8ByDNtac/qfxTsD/uCEXyJ+I8+wWroFnv5H53FLY3tPgcOGcc/7DdkIXurolp6N+/Aq3audWuGN/pZo3KEZpIa2XrNYvV47Zf+tknnTXwhvztK1DJff3J7Dnf9B8Y+HpDq7ahDBcyM/cMEvfpC58xT9ldsc3fk1+R/siOmUb5mu63l6P2qV4U0KZk2ISlSA9Ij65xKMpkyE5USwGEy+7Y27l4paucctiqGemoshIV9TpbweYnMyatRF5dAYUaE4/UrPtXKRtwNSJ0fmU0jcmac//FWHm6hBJdDEchFB+o/eKfDvNJB7pGsKiUsTabiiJDmp6JcsQUveHDeZE1i00Mk5Jp0UbWPgeYyP2NEPEbfFbpWMjGfSWCgRTNb1cspyH75ood2QQWYJjfA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f0d1ab0-3267-41de-3e2c-08dad2290e7f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 16:45:00.8495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vgBNe+q0bmN7dKXb7+2Vg1eLlKbvbjZnGm/MVJ4PwBbIhmdu/wVlNH1HktZYjHrxfNmCy4EGiyiK2SlQ4Q5xOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5177

On Tue, Nov 29, 2022 at 03:47:53PM +0100, Jan Beulich wrote:
> Neither page_get_owner() nor mfn_to_page() are entirely trivial
> operations - don't do the same thing twice in close succession. Instead
> help CSE (when MEM_SHARING=y) by introducing a local variable holding
> the page owner.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> According to my observations gcc12 manages to CSE mfn_to_page() but not
> (all of) page_get_owner(). The overall savings there are, partly due to
> knock-on effects, 64 bytes of code.
> 
> While looking there, "mfn_eq(omfn, mfn_add(mfn, i))" near the end of the
> same loop caught my eye: Is that really correct? Shouldn't we fail the
> operation if the MFN which "ogfn" was derived from doesn't match the MFN
> "ogfn" maps to?

Getting into that state possibly means something has gone wrong if we
have rules out grants and foreign maps?

So it should be:

if ( !mfn_eq(omfn, mfn_add(mfn, i)) )
{
    /* Something has gone wrong, ASSERT_UNREACHABLE()? */
    goto out;
}
rc = p2m_remove_entry(p2m, ogfn, omfn, 0)
if ( rc )
    goto out;

but maybe I'm missing the point of the check there, I have to admit I
sometimes find the p2m code difficult to follow.

Thanks, Roger.

