Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9644372E44
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 18:51:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122591.231216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldyG1-0008MP-9B; Tue, 04 May 2021 16:50:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122591.231216; Tue, 04 May 2021 16:50:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldyG1-0008M0-4x; Tue, 04 May 2021 16:50:49 +0000
Received: by outflank-mailman (input) for mailman id 122591;
 Tue, 04 May 2021 16:50:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Poa=J7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ldyG0-0008Lv-44
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 16:50:48 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b695add4-05a7-47be-a028-d058b0283cc5;
 Tue, 04 May 2021 16:50:46 +0000 (UTC)
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
X-Inumbo-ID: b695add4-05a7-47be-a028-d058b0283cc5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620147046;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XhwbN2WKRaPogBinXEEbYCDzLOhLHAc6060zm++ufT4=;
  b=TQMXn4V/7NKSjo3vZPnodcwjruNk6ee83J9ko5sZ17WbpK8j4SXRwkb4
   +qCzkMEM3KISCCGWEDv6rOXx2XibTWcrTKByLJu5/35kViHC6CK6znrfO
   NGA8LGD6Q+8ACZvtJJUS/nTDCOCL4jXBphbUt5x+U346yEMeloanel7DI
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: GGDSXdT0gdZ6kpoGsdVwKR+ZShN0z4kckMb30y0rb00P5YRTfhZQYfvJd+I/3zvc7rLs/kYlSL
 qXJ0B4WBmmg7kxGtripyVS5dDx8jFjmWATUoQmhafmDeMK9ZFOzPKLbiI8A7KB7lq3oAfDo9RD
 N1BE/XgNGhv3ulZQ7z/++X9A5u6oJbtPFKX6FskmKuG2jJksrUHWv1dY5b/uAf/P4UVfBuZjsK
 ynUkcmJW5cCm/jRKH8QLbe+2ZBTMaclSCUGDX+C16rfkYzVS4uUUABzwOjOSJa0Rc+Xf1ie20U
 lLU=
X-SBRS: 5.1
X-MesageID: 43040040
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:oDAu46H0UVEzBENPpLqFcpTXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7L0/03aVepa0cJ62rUgWjgmunK4l+8ZDvqgeOJwTXzcQY76
 tpdsFFZOHYJ158kMr8/U2EA88tqeP3v5yAqMX/6zNWTQ9sY7x99AsRMGemO2B/WQUuP+tBKL
 Oy/cxCzgDQG0g/TsP+PXUdWviGmtujruOdXTcjJzoKrDaDlimp7rmSKWnX4j47XylUybkvtU
 jp+jaJnpmLiP2wxh/C22K71f0/87GNqqohOOW2hscYMTnqgAqzDb4RIIGqhzwpvPqprG8jjd
 ikmWZnA+1I93jTcmupyCGdvzXI7Tc053fujX+ejHfzyPaJIg4SNstbiYpVNibe8kor1esMt5
 5j4mTxjeszMTrw2Azg+t6NbB1xj0yyu3Znq/ILlmdSS5F2Us4skaUvuGduVLsQFiPz744qVM
 N0CtvH2fpQeVSGK1jEo2hG2rWXLzUONybDZnJHlt2e0jBQknw85VAf3tYjknAJ8494Y4VY5t
 7DLr9jmNh1P48rRJM4IN1Ebdq8C2TLTx6JGnmVO07bGKYOPG+IjJLr/rMv5qWPdIYTxJU/3L
 TNOWko9lIaSgbLM4mjzZdL+hfCTCGWRjL20PxT4JB/p/nyX7zuPSqfSE0/kseprvkFa/erHs
 qbCdZzObvOPGHuEYFG00nVQJ9JM0QTV8UTp5I6Vju104b2A7yvktaeXOfYJbLrHzphcHj4GG
 E/UD/6I9gF6FuqVH/+iB3YQGjsZUT74JJ1HMHhjqou4blIErcJnhkeiFy/6M3OCTpItL1zR1
 d6LKmit6W8vACNjBn1xlQsHiAYIlde4b3mXX8PmBQDNFnsd60f//+Ff3pJ4XeBLhhjbs/fHQ
 JFvW5r8aavI5H4/1FkN/uXdkahy1oavjajUooVkKzr37aZRroISrIdHJFXOSqOPRpvggpuoH
 pEc2Y/NzHiPwKrr76kgpwSDPzYbP9mjm6QUJdpgHrCqESRotwuTHMHXzioFdWamxoqWiA8vC
 wBz4YWnKeH3SyyIm8+nfk1PTR3GReqKaMDAwKfaIpOnLf3PAl2UGeRnDSfzwo+Y2zw6iwp9y
 HcBDzRffHAGVxGvH9Elq7s7VNvb22YFngAIUxSoMl4FW7cvGx03vLObq2v03GJYl9Hxu0GKj
 nKbX8TJQxprurHniK9iXKHFX88wI8pMfGYBLM/c6vL0nfoMZaWj8g9bolp1YcgMMqrvv4AUO
 qZdQPQIj/+B/ggxgCZ4nIoIjN9pnVhi/X1wxfohVLIrkIXEL7XOhBrVrsbK9aT4yz8T+2F14
 g8id4up+O/PiHwZ7e9uNHqRi8GLgmWrX+9Tukup5wRp640ubdpF5TQUDfD1hh8rV0DBdaxkF
 lbTLVw4bjHNIMqYtcbfDhB+EE10NuIN0kmv2XNc6MDVEBoi2WeOdyH47DF8+VyRkKAoRb9Il
 mZ/WlW+ezfUy6KyL4dDOYxLA1tGTwBwWUn+PnHcYvaTBiufaVE+lGxN3emar9TSKSfA9wr31
 9HysDNm/XSbjby3QDboCByLa1P+Xu2WM/aOnP4JcdYt9ihfUmWiqSk4MSvnC76RDuyZUMfn5
 BEfyUrH7N+tgU=
X-IronPort-AV: E=Sophos;i="5.82,272,1613451600"; 
   d="scan'208";a="43040040"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyDygCyxKE/PYFoRE5IgDOmXNJvLwIkvLB0Ey/OcvCh116VmDEJvxAMuy9DiCsni0efHyCrQBYKmmlY2CHs07N+duJ2P2s7VtNY1FwjRsweTpOv/Q7yYCA2xoaSYtolTJO2jAT4DupaBd7Uxr27yBqaFMZRM2UuVP4ic7ObI3CxCsTE4+igXf6IkVIuckp5ld8E0dHaOnx+AzJDan6h0b7BUTsozwx5BtQ1Misdw1R/JzESq6trruQvN+s7IgVNlL4KiGfaMLupgomcbyneXXJlizbK90qC+nw0nvVNOrcUoHYOzq5is5qJaY3lYz0s3GU0wb6D+jygOcO7rMps0pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARxJWajNZ7W1OZf1kb8wuakHh0okaJWDH+NHh7IFqi8=;
 b=OkPrilEWpsG3Ime5u9A0Z3x05XUru3G2Kt8WLuIRpzF/0qM+R6tTV6ggYvknwRWXlO7shMvt/r1Qn6CLS7cPI6koufOHARZsoax2BittU83RRvXZgUgO/AkJ7ByVNa0brybEa+/rD7VpDXh9L0PtD+QBqhWq5K7c232vz4MekhDGT6b/axHg0jQ3onTmIwcZYcRXYs8VyYeh/eIrauxgflbAoksgA8VT++L0SXosOuU0cb7V78aF3H4syw2OBax+sQoc7yv35t6Ij1TNJViWrm5aYCskhiHNsCGxs3NrdT493xAWXGvQd9JMVhjd0zAYxuf4Crxskz3pCRUPan/DLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARxJWajNZ7W1OZf1kb8wuakHh0okaJWDH+NHh7IFqi8=;
 b=WLZdDJgwr5SzGFNlsUTNm5nQvCN7LpAip3Hl9IRwCIOXWfugnuJm0ec2kpykZfWG1evPidfwTKIPstu7whYz+yoiJmt215HcoPSHSxcZjYmFxOhIMO7Y9F3W2ZPOpPkLyxWW5NXX0XpXh6m3rrj5ev40ObbhXrtVypGBzEil40I=
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
References: <20210430155211.3709-1-roger.pau@citrix.com>
 <20210430155211.3709-8-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 07/13] libs/guest: obtain a compatible cpu policy from
 two input ones
Message-ID: <b12d35d6-68f8-6284-d423-e99c43ba9e90@citrix.com>
Date: Tue, 4 May 2021 17:50:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210430155211.3709-8-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0156.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::24) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3170b2a-1712-4d1b-088d-08d90f1cc0ef
X-MS-TrafficTypeDiagnostic: BYAPR03MB4168:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4168FCCED1E5E2A33FE26567BA5A9@BYAPR03MB4168.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ulWt3tFZt8K2PQDtX5yx/wDxhyY2q92t7srqv7x006RuqRdSQYnPXPEAz3+i5BV2gOhdJa3JTEWmQza1N5Z+bWenSpXmH5coRYhQI/01xWUHyVgZfV+IchptMNtoctrPMaWsvxm9sKF9bAfhT8ppnzfXT7n/dcYkbiJ8/u8SjhZlu1Wiwjmtn1phTcDbsDBy2TRt6jV67riJFBSHyJPpupU5CK1d9urM6jScfFBz732GPgUrPCMX2mlJMsMcaBbZIS01lMxQ27nCDXYJk0euufo0dYB7sZoZJyRUotkykE5YUH1JmypSMFGfTDifNguBAaBgyzMUHKjn283ysZ2Xgq8Z0hdYVaJZ31dRsmRYXp3cGvYHEdxYMJmt6XiymVhIhHpivFNyy4iCnm/S0jnFnLBkE5FNai/goUMpiKle4314n3pWkanEClO33WbeWDCM+0luToh6rcgZwsfXILzgOS0/BCXk7kbZ4uoDI3qiWIxVC80njW4eCXcRRutIUXO7pvcVGg4qSl9rTfjdT0wPz86X8Wz07+ahrTQEu7xZtmw5BhDu++iGWjhDF8DVdKAT9FUUUryqBCgu3xM3uJ6i50DiuR67ym3l1xUkDDad3Au4LL5wo3Sd/yi5AeSehWwk/R8u7eeqQ4gqpuVyIUWR7+59CP+11MhIRT5t6aFH/qI+cem3CbZexVzigJ80HZCd
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(376002)(39860400002)(346002)(16576012)(31686004)(316002)(54906003)(8676002)(16526019)(36756003)(956004)(6666004)(2906002)(83380400001)(186003)(4326008)(2616005)(6486002)(66946007)(8936002)(478600001)(66476007)(66556008)(86362001)(31696002)(38100700002)(5660300002)(26005)(53546011)(107886003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WUhKWUEyUjdkZHIySjhPYmpRbWtXaE1NN0thUlQ0M0xqNGRLbWZSQWU2eVlu?=
 =?utf-8?B?SjgxMFdheTlxZEtJN2hPbnpSMjhtcDNJTmt2N2J6UkJpTXFrMm1lSnhmeFMx?=
 =?utf-8?B?UjY3eW02TmxGelZtUml4cmpoaWlaZHRjYzVyWTRzL3ZCa2pjM3R0N29oSFAw?=
 =?utf-8?B?blJRbkttYVNUeGRia1A1b0FsdFBSMDFyeGFjUHBnWUIyejhKbHJFVmd5S00x?=
 =?utf-8?B?SWxzMll2OHA0VDJGRVllOTNVK3d3Z2ZkdGhSMmFRQnY1cTRGWUxwUFVoTGxM?=
 =?utf-8?B?cGUvVlV4ZTBtMXRJMnZ6TUtVQ1YwUmlneGZsS3R5bDdKL2liL0pNYlJzSUFE?=
 =?utf-8?B?bnk4d0xTcmdJM3VxR1kzeFpXM285NlVtcEJxQlhtSG95Z0s0OURRQ1dlbzJM?=
 =?utf-8?B?YTMzTmVsNmpLbS91c09vRVRPYUpUYUVPdVVXNzBCVVkrOEk0SE85bE5CK1g4?=
 =?utf-8?B?Q2hHclpjTTE4Vlc2VG9xb1FsY1NNY2h6WUZqRDRFR1ZtNW1PVVI5OElTd0kx?=
 =?utf-8?B?T2lBNWY2RWZDUkhiQ3ZkZTBCNW80T0tzUGlUS1IvUGpnbnd5bVR6UFJLb1FF?=
 =?utf-8?B?R2pyd1oyd1FKOU1haEhqZUpRSzkzTk1zTytqTnJYd21xYlBlaVVQMEc5UXlD?=
 =?utf-8?B?bVNadFRhbjNrSFI0eGRLcEREMisyNkhNTGVyTlcvYUFLYnMvc3hNVFl1UUdU?=
 =?utf-8?B?MWZRYml2Q3laQ0hIaDVReHdWaXZLc2RTb3pDb3JlU0ZTNTZ2ajlYb1RlT2tW?=
 =?utf-8?B?VXZCNFpCQVJQQkhmOHhwaHhaWW5YYnhHU2tyTTd6WGtGTis1TnJGVG00WTJN?=
 =?utf-8?B?cUpWRmRXeFIxSEdvQUdYK0VBcjQvSk9VQ2ttWEMvWmZsZlhsd1grWStFdk5K?=
 =?utf-8?B?Ump5QzZacGtNd29YNVlmamVOcXFIUDhBVXRsME1GWlk2TjJwVHhTL29xUFFJ?=
 =?utf-8?B?ODRMNTZLaGt1VmFGMFdCT3VtVm55UlhndGhMM1N0L3J1L3RSd1pMb1F4UDkz?=
 =?utf-8?B?NmFUOUJ5NVRqVldSTHpOMW91djZiblNSaGxTeEJxMmM3K25QS2lkeFdUWWha?=
 =?utf-8?B?R3BtMk5MaHdpQU9jRXEyaVpIYnMwTEdpSllrdUgwd1Y2YlBBY3FzRUdCdnNy?=
 =?utf-8?B?TVpRY0Y3VmpGeitUNzIvdmVXZkZ1WjhPaE9iQUkxT1M5ZnRKaFBnNS90RCtr?=
 =?utf-8?B?d3VLd05aaktpS2R4dGNSV2NKa1lCRVhXZXZGZlJuKzRESE40KzJtdFhhRXgv?=
 =?utf-8?B?UTkvd1hUeVNuOGxhZWYxQzV6RGFRT2haSCtHVmJyVEc4UUR2bVFHb0t6aWJz?=
 =?utf-8?B?bEJtWmQ1TDNmcEdOck5GbmJ6d2pHYXIwQlkwaUsrdXczZjFIR1NwUERRS2ha?=
 =?utf-8?B?SWpmRkpwcDEwOWV2Z0xvQlF6dTJIMlM4MVZHZlhqaTk2TlF0WktyOVAxeHIr?=
 =?utf-8?B?cExNNGREQTc0QVVDUTRIbDEyMi9raGp2bS90WFRHeW9kekZ5WU1weTFSQjRZ?=
 =?utf-8?B?UHlTUlpkREFHTFA5K2xhcDlwMTBiREJ0VnQ5Tk9POVhUUWhLQ0ozUit2UjhZ?=
 =?utf-8?B?TmlKLzhiK0xBVCtZcWRPQVNqYmg1S0hya0RLdnlObDBjVVJKNGRXSEh3SkpW?=
 =?utf-8?B?NHhzUjVINjREMWJLT0dqL2tUZTM0ek14Zkc2U1J6S0h0MjFCK1duV2t4MVZx?=
 =?utf-8?B?eUJJWk5FNFpMRlp3ZnlnY3FmWWROTkp1blorSzBKTHMveUlhWWdGeWRscFFo?=
 =?utf-8?Q?3ZzZ4uCCp/2Oz7+b0BlsjvF8GjrtriqjN16KxNl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3170b2a-1712-4d1b-088d-08d90f1cc0ef
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 16:50:42.1436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5K/AN8XxPR5ahvoNsf8TVeR6KlkRzhDYLbs2AAa0xdELuEK769oZyT97rl9pXoXWefH7nlRLiko+PAEJkwIkw36Mty45E3W7NFsk9VC5B0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4168
X-OriginatorOrg: citrix.com

On 30/04/2021 16:52, Roger Pau Monne wrote:
> Introduce a helper to obtain a compatible cpu policy based on two
> input cpu policies. Currently this is done by and'ing all CPUID
> feature leaves and MSR entries, except for MSR_ARCH_CAPABILITIES which
> has the RSBA bit or'ed.
>
> The _AC macro is pulled from libxl_internal.h into xen-tools/libs.h
> since it's required in order to use the msr-index.h header.
>
> Note there's no need to place this helper in libx86, since the
> calculation of a compatible policy shouldn't be done from the
> hypervisor.
>
> No callers of the interface introduced.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Changes since v2:
>  - Add some comments.
>  - Remove stray double semicolon.
>  - AND all 0x7 subleaves (except 0.EAX).
>  - Explicitly handle MSR indexes in a switch statement.
>  - Error out when an unhandled MSR is found.
>  - Add handling of leaf 0x80000021.
>
> Changes since v1:
>  - Only AND the feature parts of cpuid.
>  - Use a binary search to find the matching leaves and msr entries.
>  - Remove default case from MSR level function.
> ---
>  tools/include/xen-tools/libs.h    |   5 ++
>  tools/include/xenctrl.h           |   4 +
>  tools/libs/guest/xg_cpuid_x86.c   | 137 ++++++++++++++++++++++++++++++
>  tools/libs/light/libxl_internal.h |   2 -

This *needs* to be in libx86.=C2=A0 I don't particularly mind if you start
with it behind #ifdef __XEN__ (I'm still sure we'll need it in the
hypervisor), but this, more than just about anything else, needs to be
covered by the unit tests.

Next, you need to follow the same structure as Xen's cpuid.c for
deriving policies.=C2=A0 You can't just loop through the two serialised for=
ms
like this.

To start with, you want to calculate the min of a/b->max_leaf, then loop
over that pulling information sideways from a/b.

For MSRs, all but MSR_INTEL_PLATFORM_INFO are CPUID qualified, so need
to look like:

if ( out.cpuid.feat.arch_caps )
=C2=A0=C2=A0=C2=A0 out.msr.arch_caps.raw =3D
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((a.msr.arch_caps.raw ^ INV_MASK=
) &
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 (b.msr.arch_caps.raw ^ INV_MASK=
)) ^ INV_MASK;

Where INV_MASK is the mask of arch caps bits which want inverted
polarity.=C2=A0 (Name subject to change - perhap ARCH_CAPS_POLARITY_MASK ?)


I'm sure I had some work starting this somewhere.=C2=A0 I'll see if I can
locate it.

~Andrew


