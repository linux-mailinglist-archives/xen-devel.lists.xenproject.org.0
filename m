Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D79B6FC98F
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 16:52:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532272.828383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwOhb-0006lO-3u; Tue, 09 May 2023 14:52:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532272.828383; Tue, 09 May 2023 14:52:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwOhb-0006j9-1D; Tue, 09 May 2023 14:52:31 +0000
Received: by outflank-mailman (input) for mailman id 532272;
 Tue, 09 May 2023 14:52:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vSxc=A6=citrix.com=prvs=486b9cf0a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pwOha-0006j3-5E
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 14:52:30 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c926c8d-ee79-11ed-8611-37d641c3527e;
 Tue, 09 May 2023 16:52:27 +0200 (CEST)
Received: from mail-bn1nam02lp2042.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 May 2023 10:52:19 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5017.namprd03.prod.outlook.com (2603:10b6:5:1ee::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 14:52:17 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 14:52:16 +0000
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
X-Inumbo-ID: 1c926c8d-ee79-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683643947;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HWreJTB0eUO9kvTPP7mLgewRQZ30FWBS2UkQbnOS0oc=;
  b=R4r2tr8GbR2TFIe9TmnYDf0RM5jdg2kNMtMBzDuUpgZwWGMEQiaY5TFR
   1cogaoOzDGW+j4TfiZ09i9+qH7TEIHNvInqoBqRcZKAIM8sn0JCx8Cr36
   r/NjugGpvG4YgC5SezYafofPypEAJ8QdnfRbP3yc/4SHjHAbXGzQL4vQC
   Y=;
X-IronPort-RemoteIP: 104.47.51.42
X-IronPort-MID: 107735470
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:tnUXV6mbacVoWpAgaJMysLvo5gw3J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMDD2OOvaIYTSjKYt3a4SypxhX6pLcnd5qTgdlpSlnQiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aWaVA8w5ARkPqgW5A6GzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 doUMB8vdjWPvLiJw5GjbMhh2MJyNta+aevzulk4pd3YJdAPZMiZBo/svJpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVU3jOKF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtKS+Ljq6I12DV/wERQBTgfDhi5/sO3g065WfFyN
 l44vXMh+P1aGEuDC4OVsweDiHuFtR4VX5xXCf837CmEz6aS6AGcbkAaTz1bYdlgu8YsRSMj0
 neAmt+vDjtq2JWFRHTY+rqKoDeaPSkOMXREdSICVREC4dTovMc0lB2nZs14DKe/g9nxGDfx6
 zOHti4zg/MUl8Fj/6em+VHKhRq8q56PSRQ6ji3dU3i59Ap/aMigbpax9FnAxf9aKcCSSVzpl
 EYDn8+S/eUfF6annSaGQPgONLyx7vPDOzrZ6XZtFZQ88zWm+1a4YJtdpjp5IS9BLcIsaTLvJ
 kjJtmtsCIR7OXKraep9Zdu3AsFyl6z4T4y5DLbTc8ZEZYV3eEmf5iZyaEWM3mfr1k8xjaU4P
 pTdesGpZZoHNZlaIPONb791+dcWKuoWmQs/mbiTI8yb7Iej
IronPort-HdrOrdr: A9a23:my86O6FVHPnSzJy1pLqEGMeALOsnbusQ8zAXPiBKJCC9E/bo8P
 xG+c5w6faaslkssR0b9+xofZPwIk80lqQFhbX5X43DYOCOggLBQL2Kr7GSoQEIcxeUygc379
 YET0ERMrzN5VgRt7eH3OG7eexQv+VuJsqT9JnjJ3QGd3AaV0l5hT0JbDpyiidNNXN77ZxSLu
 vk2uN34wCOVF4wdcqBCnwMT4H41qD2fMKPW29/O/Y/gjP+9g+V1A==
X-Talos-CUID: 9a23:d7mC82ADFI8FXpr6Ew9r7GE2AuUpSSfiz1TIBW61V2A4UqLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3Aypfw7Q+umGulrw5c9CDw/EKQf4Rlxq31S0JSq5s?=
 =?us-ascii?q?Pu86GFgFtKRva1TviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,262,1677560400"; 
   d="scan'208";a="107735470"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=koe51CRkseXSNKXiwidAiCD+5MwTUh8FcscTjm86Lv16wyWd3Dvi7/e0t6jfL3icFQnVVe37TRWEqvz/QgU6x2TNrNI1I+aG514R6T2p4lAFlSgChtOeiP0gi+k0e9A4Qb4X1ujDxFGE1mx4GlG+v5cq/K2ZR8J+zkB5ik3hABAzCfqPFqiqb/WIb+cEWV3/qXLTu/DXKVKUfGa3Q7k4xuR3ByxVBzspRSv2i/4UHCi2Mgi+ved7Q394xJ/xYxXlsDSAwjTDUTy4Soq5X8yfNr9COdtVLy8c3GgZTcYnfFKpSO3wOKOGeATq+D4eo4cgirsU2CG5zoPLmSk6oe+zOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWreJTB0eUO9kvTPP7mLgewRQZ30FWBS2UkQbnOS0oc=;
 b=LFjw+W4iBMglpc9lRFsQCAWFUfPCH68gSKYjvaIMuzZC1r7Va/Ic/VsAJGk9RdqhdK/5D6XYHZfKmA6Nc0UNuB3i4y4YOdgPWuHAYSen4dMK2NrHV6yJxeiLo1B0zZ8iSgG7Bd03nCR0QSiHSiHhQmcy8T9pH1uGUC4TXgUppV120Zjp9MaLyf+VshCsBj3p74ZPH7V/h79zoszdSh2ysrXHc89d8XqLDzx7tsUE4iwT6LZVtF9yCOD3VNi106/LVk1LZXRVNvHZu6b30/CA7OBmyN69Wp5SrFoMvDRes+LpYvrfqPFrQDZis2oGRJ71T+f9FzIeeeVEV5h4flkiVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWreJTB0eUO9kvTPP7mLgewRQZ30FWBS2UkQbnOS0oc=;
 b=KC0uSAtEDi9l/rD0YET00TBu9H0kiCkGdX+kWcBRVjl/yFWR4ukHH3GGyF6q4c8m4FTv+1F72sq4dT1ARB4tGIuczkhzlkEYoinQbY8ZZHBehby9cE7M+xcXsnae7Tm2XEje2UWMjurvu9YKTsWfgfzQWd/34J1UqqAX3wxSih4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <728a0931-30d0-a4b5-4963-46b0fdf85cff@citrix.com>
Date: Tue, 9 May 2023 15:52:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN][PATCH v6 15/19] xen/arm: Implement device tree node removal
 functionalities
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>,
 Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
 <20230502233650.20121-16-vikram.garhwal@amd.com>
 <8c96d009-bd81-66c7-fd23-1f11bc07e72f@amd.com>
In-Reply-To: <8c96d009-bd81-66c7-fd23-1f11bc07e72f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0441.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM6PR03MB5017:EE_
X-MS-Office365-Filtering-Correlation-Id: e2a02048-788b-4f42-de8d-08db509cfb61
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J8pFIMzSQ0DFiJ+rVxJOMvxlypOMs7yn9NbreHWArBgEA6CbUrcWrAmzKNh6MWzzjJSzeTvc25Agp9rQ/XTpssmikP/jCU9ylJN4cMl+f45dnLI4h1Xoq10OXpFLgRBkmZE95lCAQ4NpWuAUtjNu0+7S2Xvz8qpIinCWFFS7xmTRlTPW8TGHpETa1RIVM5zpAl484AAUUp9ZqrlSWKEJy8VrDD593Rqy82b1O8jYeXjlunYwn9qWgnlBzQY4aFvBB183XBAxYBmUbkgoYDpF2/2i/C2nJPsrrYWlwUz/PXB17IrvnETIZv8cqT5eBidCq9Adj4Hq0TgswAgz8aULZ7L0awajHki4Y6Dn0rGNDhzqsifUo0Ln3Eg1k3HG+RjBEMQNmiQa6t4UfIEYgJZY9RoQ2iOsRzaZbQwPb6rAvqWrJLnJtEJlJqanTgYGo/fzY63mcK1O9QT6+NFxVFjmgLNs6KydTRuODHJW4rafmC/fZ7euAE7m/Fertr/wUzxBMr6G1/nQ4bej0f27yvGEiTb/8YFXq/7tnPMOHuiSfOfPN8kYvzLmRKVUWF0RBeeYoB5x4LVXtolYgSBfAdXC3bk7NNJ5+HyEUU1dSjvTGefwd6jieb9ZdHHVUksuhAQbcxDSgXPqpRQ6zAVH8OtrmA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199021)(2906002)(6506007)(53546011)(26005)(6512007)(4744005)(186003)(2616005)(5660300002)(41300700001)(6666004)(66476007)(66946007)(66556008)(316002)(4326008)(8936002)(8676002)(6486002)(36756003)(54906003)(110136005)(31686004)(478600001)(86362001)(31696002)(7416002)(38100700002)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFR3dDdJYjRKb0trcWdGZGFkTjlnck55b3hMYTROU25VQXJFSCtFc29pYWFx?=
 =?utf-8?B?WGVSM1FxWnJhZkN3TnRXL1FNejFuWFYzd080d2ZpWHNjZzRKTjRGM0doZ3l0?=
 =?utf-8?B?SWVjUUdiODYrY21lTGo5Q1U5M0VlVnNjNFNaUjVsb0liTWhRK3ZaYnVPNzQ5?=
 =?utf-8?B?enM3cmVQK3hXMTQzcDd4MEI0SnpWclpiMGRCanFFUDJaVmh3OE10c3AzNHFm?=
 =?utf-8?B?eVhhNWRLaHAzWEY2azdaWWZUS01Sc2hsaHN6S3BZT2lLVGFsNkprZm85ZTI3?=
 =?utf-8?B?Rzh4VjRjcWUrb2YvM2dSclN6emVYV01KTXZkR2p2RTFmV0dyVTROWFZqNEdY?=
 =?utf-8?B?OXpLcUxmTUJPRnBwc0d2TGVTWmpQOUE0OWQ1RllkWmNwZVVtbW9WRi81cnBO?=
 =?utf-8?B?aWJZdWVFazlYTnZHTHY1dWFjN0UyNFk0TlFTYU94TWdkSmJTWVZSeG1yL1A2?=
 =?utf-8?B?d2ErNTFnV0FJRndBWWpnQ0dQb2RwS3g2alZNS1M4ZXhqMXRBbGtWNE5OcVg4?=
 =?utf-8?B?MGp3ci9QMWh1MVVJNUlnRkhCQ0ViWkNNdjFmWGM5NEN5NUI4dkc0d1BHV0g3?=
 =?utf-8?B?cjc0R0NCTVJybEF0UmhUZ1NSRkYrV0MvQjBZbnF0NGJTRjN1NzNmN1lSOUJw?=
 =?utf-8?B?dGZaQWJZTVppK1pUZk5Yd1JSOWpsV3htOEMrWlVpZ0ZqN2diQ0pxUVlPWndB?=
 =?utf-8?B?dmI4WXhNMFgxT2UvSkFQNURBQWxUWWsybW1TbWJLTlZ5ZnU5WTBVb29jV21o?=
 =?utf-8?B?TVVVRnAramt5aWNvSC9jMytFQTgrdk55NitHbVUrUTdlV3hIbE9jaE92Szh4?=
 =?utf-8?B?dWRnelJxQUVVdVhFKzFZZ2lKaHMvM2I2bEQ3WnBrczlJQTFIdTRacHdJcDFx?=
 =?utf-8?B?TGtidE01MkRodDlrR1UxVXUxdnBEZmhON0EwcTc4ZlhtRG9aR05rTXoydEFI?=
 =?utf-8?B?TmxzcDZsK3ExRjJsYm9UMUsrdHE4cXZ5TnZrQVRGMVZlQVNvTXBPUVVPZ3Br?=
 =?utf-8?B?M1NIakVZLzJydGFDZ2E4cDNjQlhKa3A1UXdvdDlGMUNDaGdkd2syQzY4akdi?=
 =?utf-8?B?WThtK24zWkcrRGgrVE1MMTNDQzdUOU9ZYXZrN3VscHJsVVZ4dDRMajRwcHd3?=
 =?utf-8?B?K2NaNU1MaUdiTnYzMm9LQmtjUFRhWFRnSjFYNHZLS0FZdTQwcHFsTkEra0J1?=
 =?utf-8?B?UmpRWmVuWTZlaWF0aXB6WUxCMGpqMlMvSzVScG5XYjluS0dQVGhoR08ySFNW?=
 =?utf-8?B?R0ozTmMwVjZ6Wm9DV2U2YUZxcVhRbEZlZjlDaEpLM0dkcVpwOVBPd2Zwaisv?=
 =?utf-8?B?VDllOWZoUGV1WHRWZ20rbXJyckVkU0NlNHZpQktTdzRXUWVDYnlFeS92UzI5?=
 =?utf-8?B?SHEydE1zS21xQlNvbjJvdHZMNXIxOTNCNW9mdmxrMVp0d2FkRk9IU3dTVEE4?=
 =?utf-8?B?alVISC90aStiR1BlUVp5a1dpRWl4STQzbTc5ZGFvb3JualgvTnR1ZDdlbDBr?=
 =?utf-8?B?aGl6cVkwcjd1czN6bjVFYlplQ2JGQUVCU2g1OGZscld5YWRZaW5kdWpoR21j?=
 =?utf-8?B?b1VERmRsNGFqenJSUXhob0hTS0dadys3SjY0cmVSYUY1eXNTWGtHS084L0RL?=
 =?utf-8?B?UTJCSHRsbk1vQTFOM0o4WDd6NzloNzd5NmwrTERjUWtZbW5GWm5Td2xmbFJZ?=
 =?utf-8?B?RmRXVWt3OGlJZkR3UmZBV3ZTK3pvb0VPQzl1Vmw2MFlhMWVWTVZqVEo0ZzJC?=
 =?utf-8?B?Z2YvRHRhekI4dzk3VExGOTBuVTVEUnVnY2lMMFZxUE5uMlh5RlVISEpVOWVn?=
 =?utf-8?B?aVI5aGxsa3lwL1ZaTHJ0RE5na3JkTlJuZzE1NitqVGxBUHQyUEhjUzJndkxh?=
 =?utf-8?B?amZaUjZENm5IZDMzVGxoek5LWlI4eDV6ek90WUJBMXhwSzZJekpZM0p0SzJH?=
 =?utf-8?B?MjB0T3JyOXhHZ2o0cnkzTjlMbHlrQnptS3d2SkhQTUN3SlF1ZWp4dk5zYzQ1?=
 =?utf-8?B?TFdYQWZBQTQ1SWd2ckU4cVJEZ1d0SWk1LytJNUtoekZrUUYyUXdnYWMzZTl2?=
 =?utf-8?B?ZFYrdCtQUmRTZWZPazA1eHJRdUpFZ3lZa2ZxSjBXejhuam5qTzRzeGRPNEMy?=
 =?utf-8?B?SWFVcFNqR2RNbE9VYnN5RmRFNDhYYk1XYjZQVmRpajVBM3RVSTRRcUVHb2Fl?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XMRna0q1iKj+cpByXSKb/8oeIYzPAjlaxJmyVwezFKI533aD1Jpsvis9TeuHIIXbFizt57SrNdmJxVDJ+EVvTGvUG2MIhXI+xLHoK1zo/a+OXnvt2rm/ttwKX4nttNvwSY3t8Nq+4LJZ4FoqnJiCP+54bY7I3zfwRqHlFBFw8RQip+DNfbR5u0ktLpxHy40r6Hil3hSwOYXAF/gQGAjt0ybmoXNwgKLF8VCF/BvTTZES0lx9vqqIMwuNz9E4qhjlWGCF7VhIZHXnN2fZ8gMLcNovppP2MiX57ZlXCcVSh7A+GwGRQ2tCjnaR48ZfkK+zQp/M5RBmsEa8GuOZwSFQsdPFGZW3AzuYVPi2WRUgYa0JVUCprwOOM7p9upRQmjw3+GX+/W9xZiG0UPmSZbn4Fzgwl4Ri+RX4J5jSULRKd1ScI5nVnkixZhFFHKyAUVHzUvHga+jI3tUEmrXx6Ad7Ghl7Uykj3hTSZ2Zkb9Oxz61OCBbFOWyEOQ+wqvZGj5Lb+lfev0MfiASYvSCKvksmvNgsrEdV//rtiSbd/LFB3cVrFTBn3IPIEHvf3fnrgN6urAP/lTg2CCsW8Vqkf/cqDdYq6uftrDFywTN6iFpPe5R3KAF9zsByatywAzFJR7SgFzye7lz0xsh+aXlCkp9oPQfLzMJPcpItQSv/doDLkyoKu1DJk/IRc06tA/r2WP3EN4883b1Cqy44rAwVd5gMriUhdvBMTk59LirgwAMvknQswk2osXa1dtD9CNuKdBtO//bmsuwjQDzi5Z0VD139zlOo6oDMLADVU01Zxlvu7sJ7m+R+hmyqdmQrVGdZP/EEtxAKdojqsZoAEaF/ajpZfjpWt86UvJFTqi0B2sq13LogAI8b1EnoEFH5y6seHvZmSXjvwNvbAt0lwZTzMdEHDDb19Dpa672sU2t8AcWjeMc=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a02048-788b-4f42-de8d-08db509cfb61
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 14:52:16.8296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qp/q5aDOzpe6Kb1GBwHzU9VnmLYqIg9m/3KUka9bexMCgA5YCp8rdhYKtJSJMB+gmqnO9u65HQyvVqUL3GewMl9lK1QyO/fWeLvtmGzOFR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5017

On 09/05/2023 3:30 pm, Michal Orzel wrote:
> On 03/05/2023 01:36, Vikram Garhwal wrote:
>> diff --git a/xen/include/xen/dt-overlay.h b/xen/include/xen/dt-overlay.h
>> new file mode 100644
>> index 0000000000..5b369f8eb7
>> --- /dev/null
>> +++ b/xen/include/xen/dt-overlay.h
>> @@ -0,0 +1,58 @@
>> + /* SPDX-License-Identifier: GPL-2.0 */
> GPL-2.0-only according to the latest series from Andrew (GPL-2.0 is a depracated tag)

Well, or "-or-later" at your choosing/as applicable, but one of the
explicitly suffixed forms please.

~Andrew

