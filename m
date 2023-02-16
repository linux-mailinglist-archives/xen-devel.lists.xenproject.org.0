Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AADB3699637
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 14:47:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496559.767367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSeb2-0005WG-OY; Thu, 16 Feb 2023 13:46:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496559.767367; Thu, 16 Feb 2023 13:46:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSeb2-0005Td-Kx; Thu, 16 Feb 2023 13:46:48 +0000
Received: by outflank-mailman (input) for mailman id 496559;
 Thu, 16 Feb 2023 13:46:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ntZu=6M=citrix.com=prvs=404d376a6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pSeb1-0005TX-3K
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 13:46:47 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5780a8be-ae00-11ed-93b5-47a8fe42b414;
 Thu, 16 Feb 2023 14:46:43 +0100 (CET)
Received: from mail-mw2nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Feb 2023 08:46:39 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB4915.namprd03.prod.outlook.com (2603:10b6:408:dc::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 13:46:34 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Thu, 16 Feb 2023
 13:46:34 +0000
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
X-Inumbo-ID: 5780a8be-ae00-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676555203;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TqSFKR6plrOR3JPb0HVLbPB4cYzROpFEU0sUW0jyloQ=;
  b=LvxYIebD6LZSTfa23iTWqQvjii+/9vot8ASVQJezB109P9OJbSxPJOjT
   maOi9BUyw1pgV/LHFy+uj31JvPvfWFex3q3u0bg9LUSC4BmvUKkWkVQbK
   fCxi5XnsP+0DEiuvBsZPOdeQAVedTySJqXxoW+CZ4GSzCZR600B58dSAe
   Q=;
X-IronPort-RemoteIP: 104.47.55.105
X-IronPort-MID: 97222236
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:yl3X2qLTNW/AZT0kFE+RHJQlxSXFcZb7ZxGr2PjKsXjdYENS0z0Hx
 zYWXTyEafiMNDHzco1yPNiyph4O78TcnINgSFFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5AVgPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c59W35c9
 aU/BgsVQTXbjuOY++2/dOBz05FLwMnDZOvzu1lG5BSAVbMDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dqpTGLkWSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzHyhAthIT+PQGvhCsnmt53EjVUQtCkb4mt3jjE/5QNkPJ
 BlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWXRmia7ay8ti6pNG4eKmpqTSUDVwoepd74vJs0kAnMX/5kCqe+itCzEjb1q
 w1mtwA7jrQXyMsUjaOy+Amfhyr2/8CUCAko+g/QQ2SpqBtjY5KobJCp7l6d6utcKIGeTR+Ku
 31sd9Wi0d3ixKqlzESlKNjh1pnwjxpZGFUwWWJSIqQ=
IronPort-HdrOrdr: A9a23:pG9btqlelCmsVzNO+ePPdI015xXpDfI93DAbv31ZSRFFG/Fw9v
 rCoB1/73SftN9/YgBCpTn+AtjjfZqxz/BICOoqUYtKPjOHhILAFugL0WKI+VLd8kPFl9K13J
 0QFpRDNA==
X-IronPort-AV: E=Sophos;i="5.97,302,1669093200"; 
   d="scan'208";a="97222236"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gWe2jEb/I/kRLUd146hXLaHdPbDpkA6J3IzYqozgFEQ7WM6E/E5wpB/WZm4XAOhdAZ/0d4USfI/DhfQ+XktpDUnyW3h6Shyfqy0knKeMg3H7K04s1pcJcik5atZBc2u/tUNfKHqSaH82svuc02155hmbms1GYW1qzDf2q5XjLXCQ1rMPUGSqcBw/syKKd4/IWRrfAsV7L1haQnppfgU3thsP587i85H5Z5Z2Y8MFJlu2CnWJNfe78M8/CCXpXkFb98b+H3ehA7w10PxcGtftfw5LAPVp4An8qE55D6aGU485LizGo0Re1aHlcHgE8QPoqry5kq2ObZDU+VLskTucPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/CYXEnbNwvj9nzCZ5CA4+V4KudfCULd9RHunL4tA9U=;
 b=AUIdx6O5N/zba4AQ44X953LoSEJLW52URzosBnWeP9Wy/qIoz3LIhbonou1XMjt4ey4JRHakNdhuNcl/C0Q+G/2sIoZdH2qUPVByjgsr9SAMKSf4kkNWxeDqbDqomJJqbKpvdoHPuyT2LvP6s3OodOHI1twuVo4UVtLa3jmHYPfjei+Q/2DEYWFd76RfbtefgbqNSGSmO8tbtSiIC8QFx77NaopObF29huG3VOhrZmJGcDGRUQYtCJbCN5bFcpJbMgY6LncF2VTCv+F/TlT7vgmYwNBnDcemJMCN4WNxZ87FRYNu3oMDE6AVzfwvB/TRCDqNvD9Vk6sPrNQBgDjpdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/CYXEnbNwvj9nzCZ5CA4+V4KudfCULd9RHunL4tA9U=;
 b=P/C/u97bq61tidBO5jFfGW2Ym/i1cIv0CGjcofhsfFBrLF2yGuIQw5bWirnv75yJLhIP5p4dIH/A/at19GO86imZcjwEgQjsFBcC3D/fxn3FFHR1BbIadGEQ95KPFV4/CPKuhX+YQ/ZQz0ymQstnTK8zlIBow4OBMrL9ShGyhTc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <08b5c198-1ec1-ea72-5200-c0b842f7d589@citrix.com>
Date: Thu, 16 Feb 2023 13:46:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] x86/Xen: drop leftover VM-assist uses
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <215515af-cfb9-3237-03ba-3312e3fa0d34@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <215515af-cfb9-3237-03ba-3312e3fa0d34@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0117.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN8PR03MB4915:EE_
X-MS-Office365-Filtering-Correlation-Id: 74a12b22-6573-4ebf-d7bd-08db1024378c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y2/olQ98JklnOYijAefMNqG3dx8s1KJ/y8lLjgPJewsgEsGPwKmlWZQTRvxVKsLuXqhrxBQLPg7U6SNfTAYCt441f+7uLIoqw/CheCJUMyKqKP47C4Fv86KEJYZ7jGNXEMZ3dIUP8/YBb5Te8tRGo8s3JCDh2HnpamuYXXbraMnFRX5z7XWVusvLJNu7p+rLGjU0fhLSdm4gwZH4a/fxD0qxUfl+Uyx1bP8y7bGLwj1Zfi1gjP6evoeg5YeOgmlqh1AtaDZeLILS4Xgm2lvfQ/wedFZ1Jtap96d05KDzMC98kB+8Ab98oa6ymeG9QLc+tt8YdDUnUw6yFxUHIYvIiMwF7fu+5FFoKmfNKVEImiFgGnJlcEaRUnks/KHVPHkOrkMWs1oX65zQ3CmPwmjXZFjG2twvdOlb+GD496s948pFiUZLDmbAkMRtz3o0QsQH1lrBFrwLqFXSg8ILzrpT2t4OXUp/6N0Li46MoMZKEWf8IOxfRLswnlSWm70wfcp0v35FxCVeaf/K4Qf1Blb4XAFn/AEArfrFzNN3E9LdE66wVautyX/61LpkJLHTpm651ovpS61N6RNIqTxv4hUw3gBvdOJ8MOD/cG7T7/rVFKmJtnCBK21VPeJyB8byUby6pxytDReo6gvgCLqTFnLfVjdn8FVE8i0dpctn3nozpeYUO2ICrqD4UGn4WKdQ3qJ4yAP9v72C0eYP++XMbSXTHgvuzEdeQXnu2DJRWYIRaxk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199018)(83380400001)(86362001)(82960400001)(31696002)(38100700002)(6486002)(36756003)(478600001)(6512007)(6666004)(26005)(2616005)(186003)(6506007)(53546011)(66476007)(8676002)(66946007)(4326008)(2906002)(8936002)(66556008)(4744005)(5660300002)(41300700001)(31686004)(54906003)(110136005)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlA2aUNlbC9mN1RSUXJmQURvTy9ZOG82YVkremlBaDlIbVlhMjJwV0JxQ0hu?=
 =?utf-8?B?dTVpZm5PbzZRSEI4bjFMaGRJOC9tWk04QmZyWVBJSGtqWnJxM3BPVUlxaGZo?=
 =?utf-8?B?ditpanMzRUlaVGU2VEZZNzgzeUNqUFB6WHd3VVdqUVAwMUpXT1I5UEhKcXhH?=
 =?utf-8?B?Nk9IbEJ1d3NaL1RJd0dtdFV1WVRFSkZlT2tscm1pNm5USG92bjRWcHRoeDA1?=
 =?utf-8?B?TDIxRHVJODRvSUcydG94b2IyS0FGYXA5MlFLN0JUL1pQbjl1S1VRdFppUzMz?=
 =?utf-8?B?bHUzNm5nTERKeTZhM3BDQzF3clg5WUVoTXV2UTF1bDZzSTlkK1UxRnlVdFE4?=
 =?utf-8?B?VXM0c2JtUHpRVkpvOHBEakp3UmZ5a0twMnlzRUd5dlpPUHF6QStxL3dXVnBX?=
 =?utf-8?B?L3ZadjFWTFc5SS9SSTI1c1UxajRjd21JaG5CcXRRZnV3RllvV3hEQVBNc0kv?=
 =?utf-8?B?TTM1QTVXMGcrRm82RFpnWk9YaDl4MnJzNmo4OUlRMW1ZUmtvcVcxRkZ1MTRR?=
 =?utf-8?B?OEZ0MzVqeGVrbkREbEZ6cWttR0JET1FGZlpFSVZtSDBycU01eis3aXRGeWZ1?=
 =?utf-8?B?RjZaZXhsZXFTVENhM1B5OUdBb2twTVhrT3drbDVvYUlBbi9ld25uam52Rytx?=
 =?utf-8?B?NlpmOWEyYUl3WU1MOGpFTnRUL0RDT2ZZem1XNU5hVEcxcjZSZjFmTERjZlhJ?=
 =?utf-8?B?NW00a1hmeDcyWmJ0aFMvbGhuVHk4N2VWaERiUU8rT1d5cU9xYXQ2M29TTlRu?=
 =?utf-8?B?QkppeFU0NTlqaEM3SFYvRUxudC9QRjNzbUliVGpFOTdvZVBnOTRUOW9TZkV1?=
 =?utf-8?B?SVNDTjg1UEZoSko2UjlOUmU5c0QxZlExaVVPTzVkS0ZTcGJIbDFYOGY0VGxM?=
 =?utf-8?B?N0FnZy9YUzIrZVAzenlwOEtWLzRzYllNZDRTVHRhTkY5dTZTU3pWdmRpOTBS?=
 =?utf-8?B?ZW1nUGZqKy9MQjk2YjFKb3NjUXZVN0crK1BVd1NmWjZKUG55Szk4V3VsdXMy?=
 =?utf-8?B?Y2ZGSUt4a3F3M0s1clZSNTE4bmNkZ2dyY3ZNVlh2d010NkYrdkhLYmdXaDYw?=
 =?utf-8?B?aENRU0hDM1JRQzZzdWNHWDVMdm5sVXpQQWRqSHBsZElYTWZFRUhOSnQxZDV4?=
 =?utf-8?B?MXlDVWtQL00vZkxneFZsQVVWRk14Sk12ejg5OGY2TENUNFJKdHR2MnlmakRq?=
 =?utf-8?B?Z2NGNWlrMVVYR25Za2Q1eUF4NEZxNlFneGxrSGE4ZjZsekdTeXVvOGVSSlhM?=
 =?utf-8?B?bDVtUzdGa3lzbmRkNFZTQWkvbEJpUHNJMHZheGlhUnJ0RjJqVEgxVWxQWDk1?=
 =?utf-8?B?Yk1kSk5RWG1KNkROTjh6VFFva3V3T1ZEZGVMWUZneWZtNEZYM25wTHZENVlp?=
 =?utf-8?B?bEdlWUcwYlYrbDhXU0RjK0FCaHlCTFVWd3Q5ckRzMndCb0NXQjlhT2VqT25p?=
 =?utf-8?B?dDN2akd5R2hONXlHMlNhYkw1QTRlb1lsUnd3eFdYekZ3aGxpMDIyenRHcjQw?=
 =?utf-8?B?YUVIb3dLVVJDUXNHZENyb2kyRXhuT2pWSzF2NjJOSE4zTkxqb1Y4d21NUVZQ?=
 =?utf-8?B?YVhTK3JCd1FwLzlVbXVaVk1FdE5sdElZYlJmMlFuQVVxYVlXUk1JRUJUYjJm?=
 =?utf-8?B?YnpwQThFT09lbG9HRVF1M1lpelRaNlg1b3dob3pUeXlrZkJMbDBEWjVaWGF0?=
 =?utf-8?B?Tjd6OUx0SlZiV2FTVFBLT1JPUnJsaHgvY1FoVlFOYUR1NTVmYWNMekV4QjBl?=
 =?utf-8?B?YksySTdQWm9mRVdHcDBmc2RVMjVXbEFkc3IvOXVaZlR5ZXppclY0anJWZGto?=
 =?utf-8?B?Zy9yalhLYnJWTmNiRnAraXlwMnhta1V6TnlwZnVNL1YrYTVJVjJvU0c0ZWdv?=
 =?utf-8?B?ZU91THk3emt1SmJOek0rT0VNVW9LM2YxUTRQb213MGcwbjNrUXBnL1BSR1lm?=
 =?utf-8?B?T01FbGNyRXlsbjdOa3hyZXVtN04yQVhhRCtPdFE5aGs1WU9CWXoxbzZWWHNz?=
 =?utf-8?B?L2I3YmpES1ZOSXB0clNCWFN5dTY4QmQzSEtKaXdyeTE2eGpzeGhFMXZkODhQ?=
 =?utf-8?B?MFlBR2JNL1lRdGI3bXcrZHY5WEZLcTFFWDM5WE5mRjlmUDZabGMyT3VJRUR0?=
 =?utf-8?B?OHRUWjQ5VUtUV052RW95c1pwUFJqSFI5aEZua0xkdEh5WUFTWlJYS0RFMGtB?=
 =?utf-8?B?VFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	A71Eos/RtpOPff8UlU/UJSwvcvUBWdxPIAFChCsQ4XCKMmEkWUNsd+WmDAOiavU84XNaQsg05Ut+k/WqW/hQ65O3vilqwPfY8HBmA4Bc9EbIKy/y/xR1w/KVz/XRannq7ZAm7oIgIi/YC+rSOcBVdZtgkVFCkmTjvsa0EfA0vGegpa5P1DaRloAWaipraSVTslk7X73KeZxwLrDrN31rBkwx1kpti/rH6EAqQyB+xfx4e2/0oTQmNN70LpviVfFjkGxCmWU375aJ3mQeDCwEFLSudFKKywtwXY5PrLEPpVZqLYATXj1weXRf04tyLzFBN91+cjNwiy3BmRvnxknyLga4xeVlEmAQD0uove6pjChZ1pb43AeHAKL9VEKLNhurvHqA0fv1BKv++RgDtfov0MYbnP0okzjDdCChnWxkin+EcgxDET73ZTrT83H2EANBfONFznqrLlNcECpan+iHaC0o7SXvdcwX1OrBM4CikVhM+0p3UZRqYmfzADSdDTOVoXIcoQLzb0530mq+hGrpPPXpxm+UD/o8Upfcp3K11YTzwg4qE3PInnj0sOniqYY7fkXYQeeebPZag5UaJr4B5wYBQNyXmdAyKT62zRT1n/DNjht6YPRRheSNLwYtta7QSI9Hj5kl8JenU5z3wWqo3xHQz2atafBqgbZlJ/k7MM39kTrySRz9AQaDAVDnWjxPaFXWXmVrNjI07fGDdR19g6WGtZUbWGUC0xljzfd5qU/+Wh4peJmF/W/kNZZrnwAkY3ZqEjc7+qEZYiZ05IVBV+u+11budrDWhVVk+kJM7Jh6m+CM1kKuP8s5+rcWHfmHKePNk2ox29KIfWF4pqrfKQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a12b22-6573-4ebf-d7bd-08db1024378c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 13:46:34.3338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J148fRP3mdhKA2S4EfzLxai3K54T72qE3ylpo5q9mwJDKwSRSDmzIVl+KHr/8WzXi9hUF/9+zNQXHbU4kCweplK6rM40ma9hX7gr9PBjUWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4915

On 15/02/2023 11:27 am, Jan Beulich wrote:
> Both the 4Gb-segments and the PAE-extended-CR3 one are applicable to
> 32-bit guests only. The PAE-extended-CR3 use, furthermore, was redundant
> with the PAE_MODE ELF note anyway.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/arch/x86/xen/setup.c
> +++ b/arch/x86/xen/setup.c
> @@ -934,12 +934,8 @@ void xen_enable_syscall(void)
>  
>  static void __init xen_pvmmu_arch_setup(void)
>  {
> -	HYPERVISOR_vm_assist(VMASST_CMD_enable, VMASST_TYPE_4gb_segments);
>  	HYPERVISOR_vm_assist(VMASST_CMD_enable, VMASST_TYPE_writable_pagetables);

I find it disappointing that a PV guest which states a hard dependency
on writeable pagetables in its elfnotes doesn't have this activated
automatically.

The PV API/ABI truly is an undesigned mess.

~Andrew

