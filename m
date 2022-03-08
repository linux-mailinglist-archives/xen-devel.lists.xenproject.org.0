Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDF24D1A40
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 15:19:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286986.486733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRafs-00014E-GP; Tue, 08 Mar 2022 14:18:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286986.486733; Tue, 08 Mar 2022 14:18:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRafs-00011F-Cl; Tue, 08 Mar 2022 14:18:52 +0000
Received: by outflank-mailman (input) for mailman id 286986;
 Tue, 08 Mar 2022 14:18:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWwI=TT=citrix.com=prvs=059ab6e88=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRafq-000119-UF
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 14:18:50 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abaed9be-9eea-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 15:18:49 +0100 (CET)
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
X-Inumbo-ID: abaed9be-9eea-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646749129;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=9Vn8Ovl3/4XvehyjdBHpoyFkQ4kaTi+gv9rdkF0v3NM=;
  b=E0zradq99zGn8bKBnfAl4Xbf+7p6yKSNs/7tSkPW2Vnn4bE1Wqm4vHg9
   U30TVh8zao/6lePDxDb7RiLJD6LU4buBPl4B1o5IzvkUj1nX1reNtvzoR
   IxsiImI0j0F6a+bXnaHAJvaKOBm03XxsVHAjgg5Q2B3x5MCy2OoIpDkxl
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68059526
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:nOUswq3fKKG3M8OWpPbD5Sdxkn2cJEfYwER7XKvMYLTBsI5bpzQCm
 zEcW2DTPK2Oa2OgKItyPISw/EpS7cOEyIdqQApppC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tUw0YDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0KsN+taS04IZfhwr1eDQt9KT0vN6h/reqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u1pgTTKuEO
 aL1bxIxUQjpaRtABm4rEaI9sryqjFjDaBlx/Qf9Sa0fvDGIkV0ZPKLWGOTSftuGVMBEhHGyr
 2jN/3n6KhwCPdnZwj2AmlqzgsffkCW9X5gdfJWo+/gvjFCNy2g7DBwNSUD9sfS/klS5Wd9UN
 woT4CVGhaI/7lCxR9/xGRixumeZvwU0UsBVVeY97WmlyKDZ/gKYDWgsVSNaZZots8pebScxy
 laDktftBDpumL6YU3SQ8vGTtzzaESoIKW4PYwcUQA1D5MPsyLzflTqWEIwlSvTsyISoR3egm
 FhmsRTSmZ1UiI0W94+q4mrq2Wvv+IrsdBJk7ADuCzfNAhxCWKapYImh6F7+5PlGLZqEQlTpg
 EXoi/Ry/8hVU8jTyXXlrPElWejwuq3baGG0bUtHQsF5nwlB7UJPamy5DNtWAE5yevgJdjbyC
 KM4kVMAvcQDVJdGgEIeXm5QNyjI5fW4fTgGfqqNBjarXnSXXFXflM2JTRTMt10BaGB2zckC1
 W6zKK5A90oyB6V91yaRTOwAy7ItzS1W7TqNGc6lkET6iuPOOSX9pVI53L2mNLtRAESs+lm9z
 jqiH5HSl0U3vBPWOEE7DrL/3XhVdCNmVPgaWuRcd/KZIxoOJY3SI6S5/F/VQKQ8x/49vr6Rp
 hmVAxYEoHKi1SyvAVjbMRhLNeKwNauTWFpmZETAy37zgCN9CWtuhY9CH6YKkU4PqLQznaQqH
 qNeJ61twJ1nE1z6xtjUVrGkxKRKfxW3nwOeeS2jZTk0ZZl7QALVvNTje2PSGOMmVUJbaeNWT
 2Wc6z7m
IronPort-HdrOrdr: A9a23:MFHjH6MXxgsY5sBcTv+jsMiBIKoaSvp037BN7TEXdfU1SL39qy
 nApoV46faZslYssRIb+OxoWpPwJ080nKQdieN9UYtKNDOWwVdAR7sSiLcKrQeQeBEW39QtrZ
 uJLMNFY+EYd2IVsS9R2njCLz9a+ra6zJw=
X-IronPort-AV: E=Sophos;i="5.90,165,1643691600"; 
   d="scan'208";a="68059526"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHMncs3J3JjR9pVKyXDrXTEa4tqBuwZ1lOiX3mLmZY4XzPm+/XYgd5yXVbs6kM2BaJGLe52W8YIzNtRZKa6/1FOk9+XRjuOI1zuhO1igFI9CwlTwlW5wcKAzWmO/JfiEw3x4bEvz6zWO6MkjmfH+9KXIMJ0peiptuEb114VgwMUbcnwUILTaaHIqX6dEBuvSsLFRlaJmBJZLUGoZDUMEYOflMFEgiCgDvcqUrne6ph4MH/eRuB08uIwjCABz0WJcxG6WdVpWrfeEREdMVk6tcDLmNk+lVoAZHUyeoAQSy+AF0t3xZ4W/Uh69AvX0jvNs6HXFJEO6bhXSr1ITkpHzuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dYHZzCskPECZ/u0jzKSWYdh4cwF3TIK6L8gW9zN508=;
 b=d1QX9xd7OAL0C9xJfl66m4kO8L8VQdsFIgGwPcobtzx4g3k46dqoLk/cZ5HLXWvZLkWWfVAhI4od6CzWxzQ+HzH8DH2QA46HELr8re/ikZs1LCN0uIRxWYV5RbEjAHOi/2822PmhI6/d/iIkGqPD9jAl+9aKUFUUMToPF+9zjY8bFI3/1ip5sKquTlGzgqLIKYZ+pqF7o0zbVnqPl8tWbRVn3IAUaz13NpBhSy4YSg+8K9Nhe9uC4z13ewxkpuhA0/0VXbUaCXC1D00FegtQccyOzieG9fVV0sqQO1XSXw0vgbPLCzCkvUsdsbrtKoxcpjE8tMMa0hQWtk2OSokgAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dYHZzCskPECZ/u0jzKSWYdh4cwF3TIK6L8gW9zN508=;
 b=HWE7Gxgz0CR54Tt9EDuKuzXW5CKPWrkBFWvE3wPZ1DcNn2i1IbaxsAz2xQTT9soj1N+afStJSJY5ZhMbjH5Y1h3SRIAX/QNdjO2+W8xyXWr6pIMEDcxt9dCeidE7XL/pF90w5co2XjJFAp6bvLQi4fbsPEAvLVJCpdQGhGTc9PY=
Date: Tue, 8 Mar 2022 15:18:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/2] xen/build: put image header into a separate
 section
Message-ID: <YidlvWBauhcrAQa1@Air-de-Roger>
References: <20220308134924.83616-1-roger.pau@citrix.com>
 <20220308134924.83616-2-roger.pau@citrix.com>
 <c2e15d35-91b3-ba29-eed0-92fa19a692e8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c2e15d35-91b3-ba29-eed0-92fa19a692e8@suse.com>
X-ClientProxiedBy: LO2P265CA0345.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7d6b77a-4647-4fe9-2770-08da010e8cae
X-MS-TrafficTypeDiagnostic: BL1PR03MB6087:EE_
X-Microsoft-Antispam-PRVS: <BL1PR03MB608736F63FFE4213372AA5568F099@BL1PR03MB6087.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YG1X3dDpYowytgrWtQJNmYhx+/b6AXNI3w9CmCH3g6TVvTb6rg+YSecC52Ye13DhgDfG4frTnFZ05KtS/nk4Hq6xz6ZRP8gJPk8G9WU9G0w24DwiJuUNMHGmQGyjfeI/KNrYouaD7G8uTN7IvnoYbJnZXfFVTEe/rnIvEM9y7fGyUljj9wsFkzWjsJf9jEeIDK8BU2j9T+l+ZWJqlw9x0sUzxmZ8vZx75bxEOqV1V7TJv+ODoiSsuslm0gMjPhtREf69ttyW0ofK4exfuKs0dRCBqXUdHe5koD6YhyKxGQ8VJHV1ULHLQtgbbkYrxUQ26O5Sm9mIQYgtMA2P+z6wqkqEFkiLUfqs8fZnPVjuHgP8xt7nvaoRWiuKY0rxcrKfVf4ok8moY9qggBm3veX94Eopr2MPlKQAJVUfIjEGl+wfwyUKZXHfY8dzXFFA5VRZlmU85rYTvZUwuiyyXh1m1jP7WhJ6Yk6O7Y4OB7JVIPIppxdZCosAPQ1z34DY9OVY62Y4pdwbmFHcYvSFVuEE0kEnLd/z4ed+PXYjjU/fqfET7kKTf+TTUR0TvaGpgqDhq2lR5EbzuuYgci0euvAEe9Kj6ewNVPgXCvllJNfxd6z3ezXp/+vQ7zdjMigydtETljLE33+CGjMg/gh7HbwdIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(33716001)(53546011)(38100700002)(6506007)(2906002)(83380400001)(82960400001)(5660300002)(6512007)(316002)(54906003)(26005)(8936002)(85182001)(66556008)(66946007)(9686003)(6486002)(86362001)(186003)(6916009)(6666004)(8676002)(4326008)(508600001)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWJlSUZvbDNxVDhGUHRZa1pqSlpGQXQyZ1FsdUdyQTI5Zzd2cWQ0VlREcVRh?=
 =?utf-8?B?SzRqWVY5RTBmdWFuRzlBREoyNnF2OUFKQXNCcVpMckJGUGk3bmJlTnJrUUZ3?=
 =?utf-8?B?anI5Zm1HTjJpd25ydWpwR1d0NE9tNlk3TDJWbmM3czZSbVpmT2x5aTdZelg3?=
 =?utf-8?B?Q3hmZ1hYWEx2a1ZkSUlpdGttdWQzNlFzaEMxVU5BOWRPVWZWYVpJWEFqUnBm?=
 =?utf-8?B?elFkd2w0VFZTMnRNenNiQk9ObUdyV1RYS2VDK3hwZ095c3IvZHV5OTdzWDlw?=
 =?utf-8?B?ejkvbktDY0lobGVOM3M1WHpLY3I2WTMvUjNXL0hJZC9ya3RtWVV1WXh3ZjRJ?=
 =?utf-8?B?aExRR0VYZGNUUjVMVko2cjUweXo4U0l1ZzUzRnRsRmtRUVp0NlNkTGI5Sk45?=
 =?utf-8?B?bm9kSmZRZFhxczlZcGtoZlozWjQ4RXRsem83R2J4ZDB1NzZKTHZlMDM4ODZy?=
 =?utf-8?B?YnlMODNLRVE0THhxaUlnZnUrNWVnbnlwakwrVHZvT0hkWm8rVVg0ZS9WTkZN?=
 =?utf-8?B?RUpzdHRxMEY5WWYyeDlXRmduVU81V0d1WGZYSFdJbUVQTTgwNU4zeXhEWkVx?=
 =?utf-8?B?YW4vY3NOVXJ0VFhQTDc2L1YrNHBtQTgzN1ovd3B0WlkyTWQ3eEF3a05SNDhD?=
 =?utf-8?B?NlBpZ1Z3RDBnSXVMQVFiWCsvMjl5eEgvUy9GM3ZZMTlnblRpeTE3SFBpWlg2?=
 =?utf-8?B?NDlhK3JjeU5RTXB0OVlNQ2orKy90RWJJRGJicVRqalRnNEs3VzVLNUhIUjFU?=
 =?utf-8?B?OWlSRkdwR3FhNnRaRUFGNXR1QXVnUUVNT0pHS2Y1MWFXNWluRFlHRUN2ODgr?=
 =?utf-8?B?eE9kVE9kNUdQYy80Ui9VOTJEdE1CajErUi9sc3ppZHlaKzFiWXhZWGlKOUta?=
 =?utf-8?B?UEJKdko1Q1lXU2Rxdld5eGxUVUIzZ1cxRVVXamhqWkpwUXdiN2dUMUcvVUF5?=
 =?utf-8?B?ekxrbkI4eE03eE5tcS9RbzIycjd1UEVwRVU0clBNbXNwTzFrWm05a05jYlVK?=
 =?utf-8?B?RkJDbXhXMWZaVWpUdENPS3JvU3B4MVVzNGZDSEJIcFd2Z0ZCVFg4eUZyMjVu?=
 =?utf-8?B?Qk9pak9leThpRVpBUXhBclpjOG9PU0pYYURpUGdQQzFkblBrL2RmUm83TWdZ?=
 =?utf-8?B?MjlXcEZwTW5zKzNZK2FrZWRDWldpekhuMHVDSHFPayttMEVvVlB0cWxmaWM4?=
 =?utf-8?B?bU5aRGY5OWNOcWlPaUJHdGxuejBlNGdmRDJadTl5em5pTmlzVnBzNkk5di9O?=
 =?utf-8?B?WERxNlJPbFRiRzVVNTM1eVMzZVdJN2JCMTEvdjJZRmFJL09jYTJwbVZ5UEZO?=
 =?utf-8?B?N3FLeG1YdmtUaC9sdW9ab0VUSmprM21LaVE2TEZHajQzV21mcWR4Yi82Nkw5?=
 =?utf-8?B?Mk8rRHI4bFE3VHhxNjVwdFd2VFlmaWg0d2RXV0xYWlpFTGpmR1dzRVpOYW5S?=
 =?utf-8?B?VDluQXQ0aDAvekFsSDZlS2I1V2trSTBLeXV6RkR6WDhNQXNkUitYdGxvOVAw?=
 =?utf-8?B?L1VFemJ3SnVvWUtlTFNCUEpzWXFuQThWSGF3MFZibmNDQWd0M3k4MUF0cUpL?=
 =?utf-8?B?aHUyQ3ZEVHVUOWdjanVJOWhqNnJLeVlBcEpVQTlRa1o4dFhuMkhkVGxtV2VJ?=
 =?utf-8?B?THZtOU9lUWwwR0gyWG4zNmhmRUpkL2hyclRIcjQyaVdseVFzZDVhQlBSaDF4?=
 =?utf-8?B?SWg3Tkw5Vi9HNWpNcjJjaUlFRG1NTUN3L05sNlorbGV1TnppS1lncHlnWWlE?=
 =?utf-8?B?aHJsVGl1YitsenNYUFBXNFcvellDQ012Qm5Td2huRk9FQXlNM2pxTTd3Mktq?=
 =?utf-8?B?NVFKajkzc09CMCtSVmtVdUNYVDNmQ1ZsVGN1M3JVZ2MvekY4K1NEazBXN2tZ?=
 =?utf-8?B?bkJwQ0pweDZaVmc1THBseUtZdFkxRVFkc2JwaUFjS3VMeEsyQVdUUnBlZi9a?=
 =?utf-8?B?SEorTmpmMVpEbndTVjBNVVJTK3o3V0U5R3Z3cWpQSUZRODZ4clU1cTFzanI2?=
 =?utf-8?B?RjZzMzB0eXdDcjYydFFWZUszMXp6Nk9HVkdMY2xjZFJGNzN2N0dSeVZGWjB1?=
 =?utf-8?B?bXZVNDQyMkF2bnA1OGdjbkNLS2ZaM1RxbDdLNGV1cUhzbVpVWC9pbFZJTkRR?=
 =?utf-8?B?Y2kvVE1iUWZKVytuWXVseVllU1hGa3hFQk1lby9uM1ZIMUZCTWpXL3M3V0M3?=
 =?utf-8?Q?62V5hr5gajckyHO5ShNkE40=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d6b77a-4647-4fe9-2770-08da010e8cae
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 14:18:42.9770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RX0729J0lndXS8ksCkb3HHcf1dGmbzSRphlIDgpZShiT1I8FHoo1dSCiNhTt5Pbvt+KUYp5MckMP8X6GrEp2Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6087
X-OriginatorOrg: citrix.com

On Tue, Mar 08, 2022 at 02:57:23PM +0100, Jan Beulich wrote:
> On 08.03.2022 14:49, Roger Pau Monne wrote:
> > So it can be explicitly placed ahead of the rest of the .text content
> > in the linker script (and thus the resulting image). This is a
> > prerequisite for further work that will add a catch-all to the text
> > section (.text.*).
> > 
> > Note that placement of the sections inside of .text is also slightly
> > adjusted to be more similar to the position found in the default GNU
> > ld linker script.
> > 
> > The special handling of the object file containing the header data as
> > the first object file passed to the linker command line can also be
> > removed.
> > 
> > While there also remove the special handling of efi/ on x86. There's
> > no need for the resulting object file to be passed in any special
> > order to the linker.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Looks good to me, but I have one question before feeling ready to
> offer R-b:
> 
> > @@ -86,8 +84,13 @@ SECTIONS
> >         *(.text.kexec)          /* Page aligned in the object file. */
> >         kexec_reloc_end = .;
> >  
> > -       *(.text.cold)
> > -       *(.text.unlikely)
> > +       *(.text.cold .text.cold.*)
> > +       *(.text.unlikely .text.*_unlikely .text.unlikely.*)
> 
> What generates .text.*_unlikely? And if anything really does, why
> would .text.cold not have a similar equivalent?

That matches what I saw in the default linker script from my version
of GNU ld:

    *(.text.unlikely .text.*_unlikely .text.unlikely.*)

I really don't know what could generate .text.*_unlikely, but since
it's part of the default linker script I assumed it was better to just
add it.

Thanks, Roger.

