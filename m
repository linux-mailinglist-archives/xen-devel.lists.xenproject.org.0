Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 394EA4407FE
	for <lists+xen-devel@lfdr.de>; Sat, 30 Oct 2021 10:18:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218728.379283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgjZ7-0003vZ-3t; Sat, 30 Oct 2021 08:18:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218728.379283; Sat, 30 Oct 2021 08:18:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgjZ7-0003sH-0L; Sat, 30 Oct 2021 08:18:13 +0000
Received: by outflank-mailman (input) for mailman id 218728;
 Sat, 30 Oct 2021 08:18:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b4cL=PS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mgjZ5-0003sB-5D
 for xen-devel@lists.xenproject.org; Sat, 30 Oct 2021 08:18:11 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eaa25c2c-3959-11ec-8525-12813bfff9fa;
 Sat, 30 Oct 2021 08:18:09 +0000 (UTC)
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
X-Inumbo-ID: eaa25c2c-3959-11ec-8525-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635581889;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=cbbDuS2FKanmNTOeis47ln1sr9u/6vxwuceh6bT9SYc=;
  b=XvHOE6WgnR54CkN3e7PvYd2jsJOwY0314PtndQfkdAyrusz7E5xvxQ9E
   JVq8KCRsBjZNkGXtAmq4A5uXLMRcmBjQCIwIUhwlUSNvF2ldLFOh4DdZM
   tf0a8MdTq/ZgzULsvqhYJiuMsa94FcWeFfCq5FuPo8ENO7l3eQ7uRAQiS
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: AVpZ3E+KDDQeK9B22SNoHiNKdUbZVM0/rGiNtca8X4wWBpljgNjZK9I4RhrWhAYj94JXaxJ6jx
 V8+Mt/TuPQhMuQuJIfjRj03NU1Z6MKP3AySuVa/B5vENk52FoKxpeHOD2GvN2y9Pczv9wpHqkU
 hFGewgSsZZd6r5CH7dgK9J+vL08fn35vpAqREpu9N1PPwSsDS+xfCl930c2f+zFdycPHcYvthm
 MZDkB6DJXzgkWaz72cDXh5X0uyMQKe1mmHHyfTWJfctHi44YuTnfvO2X2H/Rk59sUP7C7zHxvn
 t8QE7ORM17FA/PMIj7ZCyquq
X-SBRS: 5.1
X-MesageID: 56243584
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:JOGg8KvrT2hRsOofQhIkyCi7JOfnVL1ZMUV32f8akzHdYApBsoF/q
 tZmKWGBO/vcZGbxKN8lbNjio0pSvcfXmoRgTwFoqy5jHylG+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cw24nhWGthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpljJ7hbwoYMYf1vu0ZaAZSLitkHax3weqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY254UQa2DN
 5ZxhTxHTj/+YCBTP24uDsgijaCDoyCkfT11gQfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krH4GbREhwcLMaYyzeO7jSrnOCntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLp3C
 WYZ5y4vpqga71GwQ5/2WBjQnZKflkdCAZwKSbR8sVzTjPqPi+qEOoQaZgdDOforhcAcfBoj0
 mSWle7jHxxugYTAHBpx6YyohT+1PCEUK0oLaikFURYJ7rHfnW0jsv7cZo09SfDo17UZDRm1m
 mnX93Zm293/mOZSj/3jlW0rlQ5AsXQgouQdwgzMFlyo4QpiDGJOT9z5sAOLhRqswWvwc7Vgg
 JTms5TBhAztJcvU/MBofAnrNOvxjxpiGGaF6WOD57F7q1yQF4eLJOi8Gg1WKkZzKdojcjT0e
 kLVsg45zMYNZyb3NvUmPNrrUp9CIU3c+TLNDKi8gj1mOcEZSeN61Hs2OR74M57FyRBEfV4D1
 WezLp/3UCdy5VVPxzuqXeYNuYLHNQhlrV4/savTlkz9uZLHPSb9Ye5cbDOmM7BohIvZ8V692
 4sOaKO3J+B3DbSWjt//qtVIczjn7BETWPjLliCgXrfYf1c9Rz15U5c8A9oJIuRYokicrc+Rl
 lmVUU5E0lvvw3rBLASBcHd4b73zG514qBoG0eYEZD5EAlAvPtSi6rkxbZwyceV1/eBv16csH
 fIEZ9+BErJETTGeo2YRapz0rYpDchW3hF3RY3r5MWZnJ5MwFRbU/tLEfxf08HVcBCSAqsZj8
 aar0RnWQMRfSl06XtrWcv+m03i4oWMZxLBpR0LNL9QKIBfs/YFmJjbflPgyJ81QexzPyiHDj
 1SdAAsCpPmLqIgwqYGbiaeBpoavMu1/AksFQDWLsefobXHXpzPxz5VBXeCEeSHmeFn1oKjyN
 /9Iy/zcMeEcmAoYuYRLDLs2n7k14MHipuEGw108TmnLdVmiFphpPmKCgZtUrqRIy7JU5Vm2V
 0aI9oUIMLmFIpq4QlsYJQ5jZeWfz/AE3DLV6K1tckn94SZ2+puBUFlTYEbQ2HAMcuMtPdN32
 /olte4X9xe720gjPduxhyxJ83iBcy4bWKI9u5BGWILmh2LHEL2ZjUAw3sMu3KyyVg==
IronPort-HdrOrdr: A9a23:IlaWOaCM8AGpCmPlHeg2sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHPlOkPQs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QD5SWa+eAfGSS7/yKmTVQeuxIqLLskNHK9JfjJjVWPHlXgslbnnlE422gYytLrWd9dP4E/M
 323Ls5m9PsQwVcUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZvzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDj1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXoyEfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplW92/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 ghMCjl3ocUTbqmVQGagoE2q+bcG0jbXy32DXTqg/blkwS/xxtCvg8lLM92pAZ3yHtycegC2w
 3+CNUbqFh5dL5gUUtMPpZzfSKJMB25ffvtChPbHb21LtBNB5ryw6SHlIndotvaPqA18A==
X-IronPort-AV: E=Sophos;i="5.87,194,1631592000"; 
   d="scan'208";a="56243584"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzX4sEJaHB/AsAsyHXe06Hj0nsDX5E5rvGmz4hsuBgzK6Xm85buO1P5K5sJkO33Yseiv+o8rXixHdju+53+Zeye1B1jB+yMqqioP0Aujy6kAIBkDoyR+nSRaMEFN+JO+Y3osYj5uk81T038XzeCT2dDaHJoQt6m657KCcV6ScwaMNuSnHAaF/t6qh24jB9SrEhu1+UB6VyV6xLL8DnYA8+gsxCxyTN85YbygJ2ZjwOngp84t7IjsmVCL6XfjN/VGtl+Qg/BbXO5OGEpcuUiwr4yeOaZ40H9HjM/7U9s0wwmZwhil3JDZ2G14w4EmFmQPVqXcPqgO334HF+wif60UBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ThJwByg0/5txHY7BxNW5mZlbW9ULEWYcHuMqtWwzpRc=;
 b=ItOyEQHATH4dnF7xRdFCacSFHRkPuHMBqvzWEHKcuvnZ2uTbuRsBHIa1R9dV34EyGcYS44UtvhO/ZtPlPMD6UATh0P44czYLaAujXJsedfidgsb4VmRystVlfqn0TsQEUfh959jbfjdI32JsOmOf23+3uIlo4tJiK7yCrIv1NaN0UOhWKtRPldnLO4KIbIdxl7NFy8m48GD8Xa+IFw5C63kkmQfssGJHZArsAGowars1XSvq9IRdrOoqeKO2Ph+fdOCJ9M+4n3UfbVAp4dpS+LslAZkvHLsvn/itKy2hgFJ3vZ5g8QR/uaE/d7K0lNirJgKoXD8PRCqLXIlg9F/Pzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ThJwByg0/5txHY7BxNW5mZlbW9ULEWYcHuMqtWwzpRc=;
 b=czgH3p8tI5emJgEy5egu+LfRq8LkjEREWTQ4P0KKqsXn/vSz+/tK/GLwFqtVGlHP2shgK2o39+JxVpAtZz6AUN4TpqvqlHT8GzT8FF4qdFltG7mwJeTuuQEGEAAtjyv3U/nWN97Ki0fMbY6gWmnPlry2a3BR/mftCc6VbM0VXnU=
Date: Sat, 30 Oct 2021 10:18:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH] x86/passthrough: Fix hvm_gsi_eoi() build with GCC 12
Message-ID: <YXz/uYqxfV0GaEoH@Air-de-Roger>
References: <20211027200713.22625-1-andrew.cooper3@citrix.com>
 <YXpRzHEawUZEU87h@Air-de-Roger>
 <64788530-a18c-332f-c287-84478a200816@citrix.com>
 <YXqlEQWk1HGNLKq3@Air-de-Roger>
 <99c451d7-4a7f-8dd0-17f6-92b2153d0afe@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <99c451d7-4a7f-8dd0-17f6-92b2153d0afe@citrix.com>
X-ClientProxiedBy: MR2P264CA0089.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::29) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84ba1851-3a92-4ad6-2f5e-08d99b7dcd25
X-MS-TrafficTypeDiagnostic: SA2PR03MB5915:
X-Microsoft-Antispam-PRVS: <SA2PR03MB5915595B5497FD4167CD831A8F889@SA2PR03MB5915.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QO8dXBhgAH52xHSnNd0ci0xp2ly9zroB/DJ/KRMJ3lxEc18WLhPM2NQl7dXItTrqBGz11Gg+0i0prz8MlY0ZVNqIPBjAr/PbzWJ14N5h/WjKYLCd1/LPiPpwz6avv+bp+fsQQfkiKX/W5OuEm66j9/5euYWNEVKgu12zDDcr9XldPScHLAHtFp4/pnytwH5DS0pPqgZ6fWYi4eEpe/8YZS8srXhE+YcvizX4ThEhn4BISqwHYOlz3eeJQhDaR5iSLW2EVtRmy2XW5SiVVd5zYB0TPlmMpnmjs4rc9PEMg8F0uzUUD+trwP1YGMFpiZuJ6kNz7W6iQmAKLrM94WJloGmDnkGyxcHfhTl9ej+PcHuvudMSQ9+J/wxLVISOR7wymMSYqd17MVR3NAF1iq6nCGN+2YbqeiVkMOh7+V2r7DLp2LTgJjQamLLkN8jzJ9tKnoB4R7wWXy+7QvXtTxO2FrabvR86r9eru+KZM/j+ME/ZLf3BbMso3m0cx/7ncw45oNi+S2JChZLrDkm9CFELTjeU2hLCZl3uxrM7Bk9feUa8LKe6nhC6ufSElqdCEtbowaxnzIMB6vsmc5AFO8z6OjXi13MrwWvB9JtrpUAMVzWF9nDFrDT4O806xcKK9Ou918/b0U1q6RgeGfA7laBqNA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(508600001)(5660300002)(38100700002)(8936002)(83380400001)(6636002)(33716001)(9686003)(6862004)(4326008)(53546011)(82960400001)(2906002)(186003)(54906003)(316002)(956004)(85182001)(6666004)(86362001)(26005)(66556008)(66476007)(66946007)(6486002)(8676002)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlkrRU83YjdFbDA1em5VaG51bXQyaFM4TS8yNkhyQkxGazR0bFpON2U1K3I3?=
 =?utf-8?B?eFZiN2ZNSEpzZThrNTlQeXZvc0hzRmlVaVg1ODhCSFVwd1JIeWVsQlVTZUJo?=
 =?utf-8?B?SXYyMmZQVHU3QUZUb3pLVDBlTlJnbHZYUjRWdjB6SW01c2JmeE5XekwxYjVE?=
 =?utf-8?B?UmY0bVh1dG5ZbERseGxYK0RkelJyeHNkckRoSFordGp2NEJmdjg2aFVzLzZm?=
 =?utf-8?B?UC82Zk5EVTByeEp1RDlYdlJ5cmQ1V3Fja3RFdExqRDMyUzkyT3RPcDZPL3Q4?=
 =?utf-8?B?RnEycHU3SVV1cnFJUkNvbDVjSng1N0NUYmhiOExXTVdkVGNhUlRTTnhHZjVR?=
 =?utf-8?B?M3FzWVJPWjFHNElVT0kzeENhcEhkcEUvUHpEeFgrb3VTT0tKRFFENWpjWXpr?=
 =?utf-8?B?THdXcDRsNFI1YW5BdEUvaHllYXBSRFNvMktEWVRheHdQWFJjMHdjeXc5R0Ez?=
 =?utf-8?B?aGh5bUtJR25DRHdjQ0pEZFc3REZxYnRGMjF3ckh0Ylc0T1FzR0NWQ0FOWHMv?=
 =?utf-8?B?S1UxZDJzamVJYUpGVHhMdWx0SUZ1YWw3OEc3QUNQSlFzVlRxQ3UybVJwR1h3?=
 =?utf-8?B?ZEZ0QVVwNmFzSk9ETXZRVHdxWG5maTc4bitHZXZiUmZTNUllK2xqemp6RFBP?=
 =?utf-8?B?c3FnZ200bmlwQzQ1ZVBCOVR2UC83TmJIWDFmY3BDczB2b1RybWx4a0lqd3dV?=
 =?utf-8?B?RzdKWjZGUmNuZ2FRVnl4bEtSaTBkdGF2VjZlMHZHRDBEaHpMYnBWcTd5K1ht?=
 =?utf-8?B?ZnBmSUcyRC9pZkFLWFNUdXNrRW5vY2xDb2twN3dBdS9FRjhXbHBGSXdEdjls?=
 =?utf-8?B?Q1B1cTBxV25iaWYxZ2twWDR0d2p1ekhDYnZqVk1selRHWEpZTjd1RENsalNz?=
 =?utf-8?B?WFhIZFdIYmd4QWFPY0dxSFBxcERnaFhlem5iVTYzWnN3Rll4UmFPbFI1d3pB?=
 =?utf-8?B?QWRSTGxTeGhlKzZsK3RmN0JFR05TcWl3ZXhYTVA4MUFCQTIvU0ZKUHdNZ28z?=
 =?utf-8?B?cXJDbHR3WHZnMVVjTE9oUjI5M3Y5Z2V2NENGeVRpaVcvNVVrcmVVU3pXQ3ZS?=
 =?utf-8?B?clorU1NyRXcwTDlabWszMDZDUFBZQlR5czNuWEthODBoNkxsd3lwaGltcEsz?=
 =?utf-8?B?VnR4bHlQU2dmUjI4TUFzWUVGUmhIWmJrejRacG1NVVVabXBHMlBqM0hDVkNu?=
 =?utf-8?B?TzcwSTA2SS9rZ3JlZHlUVU9tdEQrcUFBdHovc3pXUzZaVmx2MDAwdnhGVkFM?=
 =?utf-8?B?aUxOdDYwTDRWdmxwMUQ2UnNOcW1GVnVCaWVtTWp6Q1UxSUZlV1YvL1RLUnNZ?=
 =?utf-8?B?eEV0MXd6VW1JbDBxbVMzejFSZkhYUjRhdTV3bEJwVTF6UlZCMG8vaTZqQk1s?=
 =?utf-8?B?T1B2K21sZmNKWGk5VmtuYk4rOTFOUnAzSm5LOHpkOHY0QVB6N1ZWdjhVWjZE?=
 =?utf-8?B?emJ2NG9XMGJIWEY3V1l5dlRFVE9ibk4rczdPdjczT00zMzRmTDZtRUZkNXVX?=
 =?utf-8?B?MFJNN3VrR3JmNE5vZHhxbk9Qa0t2VkZhTitlMUYrbXNwdjVvWDQ0Tk5abDQy?=
 =?utf-8?B?TnVlcnl3RmFKMG54ZXNudWc5MGsrSTJLem9MV3VjYmg0VS80QUpsaERzQUgv?=
 =?utf-8?B?OUE4REdQc3VVMWJaS3RrUU0raDZ3YjF0VVVyUWQxT3kyWWs5MDg1MFhVOVFm?=
 =?utf-8?B?QkE4MUtpYkgxTlE2Y0RwR2lkaFVDYmh0cU1qRm04NWJiYWd0L1BkdS9MWGNr?=
 =?utf-8?B?VXZYSjRpWkI0TjlrRFpOUGpXWWFOeVN6MmpUUkJHTEdpOSs0MXpOaDI0WTRX?=
 =?utf-8?B?SHBYbHBmbDdWVGxFT1NoNkZFTEVteGVFYk1hTUVQcWJvNnIycmdvWVY4OHlS?=
 =?utf-8?B?OFFnRDU4RFVKVUxPYjVMdWErb2paZ3pML3M1WTExN0QxVUhqZG5Cdml6eDdz?=
 =?utf-8?B?RUcyQ3FaNDNjZWxUSERULzhudUFFYXk3dlpBRzROUDJGUTNuK2pNRUg2Z0J6?=
 =?utf-8?B?eVlZRU9wcmJwZDFzSmlvc1VGcnFmQWJnUEdqSEN1b2ltU09XN1pqQ1NVRU5E?=
 =?utf-8?B?cEtxV001STRMM1YwTFl1YTFoc0JROFdqMHpMSk1teEszbFZBL0lUTTVYYVFO?=
 =?utf-8?B?QkdpRnA1ampYWTRxa2hpak1LNmNKNTl1KzhhWURJNjlDTDMvb25WZHRmMWhi?=
 =?utf-8?Q?Iaa6mcy6eBQEy0jugqF+YYA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84ba1851-3a92-4ad6-2f5e-08d99b7dcd25
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2021 08:18:06.7397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w6IH6d7GMnnHpb/dySETjsH+kSyf++AfFmyshkllG6lDQedWyE2EtQpcqfac1cJLgH/d0PRZI6T5r+jAzsw3cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5915
X-OriginatorOrg: citrix.com

On Fri, Oct 29, 2021 at 07:06:43PM +0100, Andrew Cooper wrote:
> On 28/10/2021 14:26, Roger Pau Monné wrote:
> > On Thu, Oct 28, 2021 at 01:15:13PM +0100, Andrew Cooper wrote:
> >> On 28/10/2021 08:31, Roger Pau Monné wrote:
> >>> On Wed, Oct 27, 2021 at 09:07:13PM +0100, Andrew Cooper wrote:
> >>>> GCC master (nearly version 12) complains:
> >>>>
> >>>>   hvm.c: In function 'hvm_gsi_eoi':
> >>>>   hvm.c:905:10: error: the comparison will always evaluate as 'true' for the
> >>>>   address of 'dpci' will never be NULL [-Werror=address]
> >>>>     905 |     if ( !pirq_dpci(pirq) )
> >>>>         |          ^
> >>>>   In file included from /local/xen.git/xen/include/xen/irq.h:73,
> >>>>                    from /local/xen.git/xen/include/xen/pci.h:13,
> >>>>                    from /local/xen.git/xen/include/asm/hvm/io.h:22,
> >>>>                    from /local/xen.git/xen/include/asm/hvm/domain.h:27,
> >>>>                    from /local/xen.git/xen/include/asm/domain.h:7,
> >>>>                    from /local/xen.git/xen/include/xen/domain.h:8,
> >>>>                    from /local/xen.git/xen/include/xen/sched.h:11,
> >>>>                    from /local/xen.git/xen/include/xen/event.h:12,
> >>>>                    from hvm.c:20:
> >>>>   /local/xen.git/xen/include/asm/irq.h:140:34: note: 'dpci' declared here
> >>>>     140 |             struct hvm_pirq_dpci dpci;
> >>>>         |                                  ^~~~
> >>>>
> >>>> The location marker is unhelpfully positioned and upstream may get around to
> >>>> fixing it.  The complaint is intended to be:
> >>>>
> >>>>   if ( !((pirq) ? &(pirq)->arch.hvm.dpci : NULL) )
> >>>>                   ^~~~~~~~~~~~~~~~~~~~~~
> >>>>
> >>>> which is a hint that the code is should be simplified to just:
> >>>>
> >>>>   if ( !pirq )
> >>> I likely need more coffee, but doesn't this exploit how the macro
> >>> (pirq_dpci) is currently coded?
> >> The way pirq_dpci() is currently coded, this is nonsense, which GCC is
> >> now highlighting.
> >>
> >> It would be a very different thing if the logic said:
> >>
> >> struct pirq *pirq = pirq_info(d, gsi);
> >> struct hvm_pirq_dpci *dpci = pirq_dpci(pirq);
> >>
> >> /* Check if GSI is actually mapped. */
> >> if ( !dpci )
> >>     return;
> >>
> >> but it doesn't. Getting a non-null pirq pointer from pirq_info(d, gsi)
> >> does identify that the GSI is mapped, and the dpci nested structure is
> >> not used in this function.  I would expect this property to remain true
> >> even if we alter the data layout.
> > I think we have further assertions that this will be true:
> >
> >  1. d can only be an HVM domain given the callers of the function.
> >  2. The pirq struct is obtained from the list of pirqs owned by d.
> >
> > In which case it's assured that the pirq will always have a dpci. I
> > think it might be better if the check was replaced with:
> >
> > if ( !is_hvm_domain(d) || !pirq )
> > {
> >     ASSERT(is_hvm_domain(d));
> >     return;
> > }
> >
> > Here Xen cares that pirq is not NULL and that d is an HVM domain
> > because hvm_gsi_deassert will assume so.
> 
> We're several calls deep in an hvm-named codepath, called exclusively
> from logic in arch/x86/hvm/
> 
> is_hvm_domain() is far from free, and while I'm in favour of having
> suitable sanity checks in appropriate places, I don't even think:
> 
> {
>     struct pirq *pirq = pirq_info(d, gsi);
> 
>     ASSERT(is_hvm_domain(d));
> 
>     if ( !pirq )
>         return;
> ...
> 
> would be appropriate in this case.

Fine:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

I think I would prefer if you could slightly adjust the commit message
to mention that is already exclusively called from HVM only paths,
and that as such the HVM related dpirq structures will always be
present.

Thanks, Roger.

