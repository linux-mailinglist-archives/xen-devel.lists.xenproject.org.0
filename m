Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0F74D6122
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 13:04:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288998.490247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSdzz-0004Fl-Df; Fri, 11 Mar 2022 12:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288998.490247; Fri, 11 Mar 2022 12:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSdzz-0004Dv-AG; Fri, 11 Mar 2022 12:03:59 +0000
Received: by outflank-mailman (input) for mailman id 288998;
 Fri, 11 Mar 2022 12:03:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RXIo=TW=citrix.com=prvs=0626a3ed1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nSdzx-0004Dm-R7
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 12:03:58 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 528c3dd4-a133-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 13:03:56 +0100 (CET)
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
X-Inumbo-ID: 528c3dd4-a133-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647000236;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4RLoqQ8C8eE+/ksvJoStTEPEt200uw42WoB0YX88IB4=;
  b=Ip7McgZcBgR9FjRchv0bumI8i+WuTBrl80Et27fpsxaIMWQyrfZxSr9k
   7YaI7OZNUWdUe6K0vyNxsv159nzHWF4IQBmuV9CBU4HaEKcJedL5ndcEM
   RGakKpvrkk8/mWXN8r5TY4tCrKbiTxc5sgb9hN+mLQCVIAY3jO1lYjHhy
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65933907
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:5ZJb3KqNtxkHxSmahedM811eT1heBmIOZRIvgKrLsJaIsI4StFCzt
 garIBnUOPiJYjaket5zbYmxoE9VscPQz4JmQQo4+S5kRH4V+JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvW4
 Iqq+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBOKjmmbQXUzZiDTwgH6RMxpzaKyeziJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI1zbWAOxgWZnea67L+cVZzHE7gcUm8fP2O
 ZdIMmE+NEuojxtnMXUvCa4ArP2RoCf8Yxt3qkmtiIku7D2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajkKOdraxTeb/3aEgu7UgTi9SI8UDKe/9PNhnBuU3GN7IB8cWEa/oPK5olWjQN8ZI
 EsRkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcU87SuMmqDUzDyHGzYmRzR/S8Es68MPEGlCO
 kCyo/vlAjlmsbuwQH2b96uJoT7aBRX5PVPudgdfE1JbvoCLTJUby0uWE409SPLdYsjdRGmoq
 w1muhTSkFn6YSQj86ygtW7KjDu3znQiZl5kv16HNo5JA+4QWWJEW2BKwQSKhRqjBNzAJrVkg
 JTis5HPhAzpJcvR/BFhuM1XQNmUCw+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43bphVImC2M
 BeL4F05CHpv0J2CNP4fj2WZUZlC8EQdPY69CqC8giRmPvCdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqPLbimn0XP+efPPxa9FOZaWGZim8hktctoVi2Oq
 I0BXyZLoj0CONDDjt7/qtdCcwpVcSBlWfgbaaV/L4a+H+avI0l4Y9f5yrI9YY112aNTk+bD5
 HamXUFEjlH4gBX6xc+iMBiPtJuHsU5DkE8G
IronPort-HdrOrdr: A9a23:fDQVFqlQuPgOwWF7+aK+KcDN8GTpDfPIimdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcLC7WJVpQRvnhPhICK0qTMqftW7dyReVxeBZnPHfKljbehEWmdQtsJ
 uIH5IObOEYSGIK8voSgzPIY+rIouP3iJxA7N22pxwGIHAIGsNdBkVCe32m+yVNNXh77PECZe
 OhD6R81l2dkSN9VLXEOpBJZZmJm/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjMTSSlGz7sO+X
 XM11WR3NTvj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZrA+1Dr1fqOk2lqxrk3AftlB4o9n/Z0FedxUDupMToLQhKffZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIfwsCrDv7nVMS1cooy1BPW4oXb7Fc6aYF+llOLZsGFCXmrKg6De
 hVCt3G7vo+SyLUU5nghBgu/DWQZAVxIv/fKXJy+PB9kgIm0EyR9nFohfD2xRw7hdcAo5ot3Z
 WyDk0nrsALciYsV9MOOA4we7rFNoXze2O4DIuzGyWvKEhVAQOEl3bIiI9FkN1CPqZ4i6cPpA
 ==
X-IronPort-AV: E=Sophos;i="5.90,173,1643691600"; 
   d="scan'208";a="65933907"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ofwpSxKC/7JUsscpPWbfnWcw7uj8xhdyIqtDCKUwI2rq8MPNrYHOR1rDFrGPJw9Yu2vWi3SFR/DTUDOwBukVGvoz2xzXt4afYy42tL8FyRZ5u5CW7fq09Oq18bOQG0N3esyM0fCe3AchfBhVBiDvWJe/cQC87ziXA9UiyhX3/nSQyf0mRbLbxQRzajU0johX7gnoXUdbmzidKVbEMenPPUzzxA3wlJRj03Moz7vN3oUy7Dn8wWNICNuH/YCh0VZU6WJLMnUXSQjPlNfTMtQkHY66XYGXh1KmHJ3ACXzgdPD1sGwU1YXzzdmMzy6fdT4qm1GLJJCmR4WmghQ2s7CaQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/rItIzYlJMusMY0MQsyzIG/dtNn3y0YWMVd/og4abL0=;
 b=mHzhzzA6e0WqxpaOwBsJKR3+rIkD4oBWKti5293pmM9H3JxNLuptsOVLIBaATLwCLa//V7a7kSIFN1/AFVYyphqMCiH9iBnBgxSgxo2T/yMYq2n9MpgdQNQnvJSB94TtPIR7JaIpLqOmp5uZpkueDiHpH82tQ1BthttfAv7yf07Ouw48Zcxp8HNeGR1hXlXByxm7tizj7ogvB4I5Hkvt445F22dh+ezXQAO/fsv/AXNjZvdVbnzsHBEMYtqmNKBNvEJKZIE9K2Flsf7miDhhoHUuuzkU9/DCgbE60qN9RQFT4BEOn6mpS2+fLoBJj8oashhoXzGe5cWgb7U9Zi4RkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/rItIzYlJMusMY0MQsyzIG/dtNn3y0YWMVd/og4abL0=;
 b=MI+0bDMVqUuptrEyvu9DK6cRvXWqkm+ENo5ICt4VQaPS4xq8GtvWWw5yQN2afvWcGoTcmjOBL63xjv3cCcL28XmKIOUIhsaSQeBT5UEc7R6ifnxw2EqE8gripvIm/X9jd8hrzpbwP3UkisVuMZhEvVCPGquxzxg7j1LnGfgB5ZI=
Date: Fri, 11 Mar 2022 13:03:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 1/4] x86/time: further improve TSC / CPU freq
 calibration accuracy
Message-ID: <Yis6nrchuvzagfOb@Air-de-Roger>
References: <35cb3c72-05ba-24c7-1fdd-3ee1aced3aec@suse.com>
 <65c123fe-c8e7-b9cf-4dea-904bf28170a7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65c123fe-c8e7-b9cf-4dea-904bf28170a7@suse.com>
X-ClientProxiedBy: MR1P264CA0070.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca8dddeb-78ed-4ace-afa8-08da03573337
X-MS-TrafficTypeDiagnostic: BLAPR03MB5649:EE_
X-Microsoft-Antispam-PRVS: <BLAPR03MB5649CBD0BD2B4CA3E51E79B38F0C9@BLAPR03MB5649.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c+TO6j4lU2sGokM8LecQqXSg6KMjBRtd5NjBwMWtmcg/WdCawbGn77jsLvVXfMgFOe4EXMXZPukjdlzuo3YSlShYg1UVA99QrdkQgecfVGBfH695RQg5vT6mpetwQPzn/H3Kw+hSVr08FhQrgAhCSto18PDPeqL8SXKOSNv5yDjP1xQG0FonhqybmgQofWjVoDUzSwJUiIAtRSPkm5An0Ytcu7L0nBIN/W3EsH8Qso1GAqr1zFmDEJBdlQoSSPFIMBtchXlZIY+jHKHo9QE2FeNxAEq2+ZZjtE4LYiQZfNS8prni8dAZGJgP3VPxm04wGjmn4ztWAFzzIMJ6Kn5oO1OUMBvvXQPPsYFz2oZNSGr383EAR1MXlxlHIHxt937DrDUka25s/k8u+9uywbgWGMVegZHMmsdNe3zMJPzxgZrsxCzsrwERuopldvkfdVxEyDkF5dy9fEy0cS9JAH0kkE5jHrZLFwinMn+c5bRBVaqVBnxAvQsRIyOi9fzi92sFlxddMMUrJsqjwdT3qXS3svInzeHNAOs7HddLfCN4NBYMagc8sMQyWpwb9i0JHhAkPeVhlwHsbC62Djn4B/W2FTZPQRutIvnwbF9dr7FzxBdt6Z2X0qv8D0/tPT+WFYQCCdyI+vLKZ6LNspCE9og9Eg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(8936002)(82960400001)(85182001)(66946007)(66476007)(66556008)(8676002)(4326008)(54906003)(316002)(6916009)(5660300002)(2906002)(26005)(33716001)(186003)(6506007)(6512007)(6666004)(9686003)(86362001)(83380400001)(38100700002)(6486002)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3pFdU12ZXNmd0VpZ2NnTE5RZHBmVEhRaWtJVEdGcU53bzZCVU5LRHBxVzJ6?=
 =?utf-8?B?LzI2eHpTY0FmSlZBSmxkWEREUFJ1amxnL0xkQU1QaHJQZWprYVhOUDJiUk9L?=
 =?utf-8?B?VVdMU1VURVhJcnFKTk9IMUN6TXdObXV3TG1vdlM1RkRQR2l6eDBqSkJBTzVw?=
 =?utf-8?B?ck5zeFlkQjFZVWFDbVNJS01FaVROYytCQU9VS2ttT3A1Y0tqclZWLzg4NW9B?=
 =?utf-8?B?d2V2U01QaE5WeG5oMVFYbmZNU3paRUtwWHBYNVUyTmJEUytSN04zaG02c2xX?=
 =?utf-8?B?elFvajdpUUtuL2hEOHVoN1pvdkR4TDFjV0hlV2pKc3BjVHJhdUwxaUFEK0s5?=
 =?utf-8?B?S2dWQ3Ywd2sweklzL2Q5MHdyOGRleXNsNUJSdXBOSHBJS0FKSlBzNEZDM0M0?=
 =?utf-8?B?YzNBeUNYQkNJN3FGeHdzeHMvRVY2a1VOT0NxMzZja0dmNThaOWxZdWZOWVIx?=
 =?utf-8?B?ZTREOUNMd3lOWllpV0pYUnZoeFVDczAvWTI5N1RHbWszRDFwSUJTTVJzMFFH?=
 =?utf-8?B?RUZpSjRRRDA3c0g3aWJreXZTcFpDdU4wUlY3Q1lxQ3dzcFNyazlMNm1YYXY3?=
 =?utf-8?B?cWxHMGREdjFybVVzZDlBQW84ZDJ2RjQwZmxlOVcwaTNOWGZ3WS8yRnM1c09l?=
 =?utf-8?B?QTRGamxyY2o5MSttUkZRSHM0bnd2SnNGN1hhU25hUlJYcGNHWmpsNXpRN0xj?=
 =?utf-8?B?bjhaOFBjQXE1REFaR1Q3SjJxUVJ6Q1p5R25HM0NwQXpPRzk5M3Z1VnMwZitn?=
 =?utf-8?B?T2FUVVVnY09BM3hIOFBIME1XNTg3MzlhbURReHRFUGxYVE1tSEZKOUw4STlQ?=
 =?utf-8?B?K1NKbUpwdExIY1UxZlRuWERtbVhMV1UvM2lNbWp1ZE53QzFMNklCTUM0eUNX?=
 =?utf-8?B?QkF6RVJBM3J0TmhpZDhRTW14NGl3dlRxZWRLNVhRVnIrRXJ1NmtBSnBpQmJW?=
 =?utf-8?B?V0pEbDB1TmdmVlRKUlFUZzNZWWovcEQwc21EUHkvb2NRcXp5NHlPVWFIU0FG?=
 =?utf-8?B?a1dyZFF0Mk5NOUZ1ZWpCODlidW5PNklicUE5Qzd3OFRkNUxlUldPNk1EUy9x?=
 =?utf-8?B?d1RHM2padytnL0NKWnJFNmw3UFdlNlJ2UTl0bThpVEs2YmpVNDFGMDFWSVBp?=
 =?utf-8?B?OHJySGkvK25RRzBMSU9UQkJVa2tHZHlpVlpuWGgwUjNjZjV0RWRvdW5Bb0pm?=
 =?utf-8?B?WUZhTHEzaHhkZm4veEhJcXdtK1J6djhSR0diaUtuaDFVTGJrZWdDdlB0Q1pH?=
 =?utf-8?B?d0piWkpndSswaFFWSXJmUFRkK1pWQVd3NDIzeDZJMUczYU1CSUdpRG5sdi84?=
 =?utf-8?B?N1BmYVM5R0JZenJmL0lqTnBhRTlQbEVpeXhNemE3VHJXV2lqNUo3b0NtQVpn?=
 =?utf-8?B?Qi9RQllNUUlCdE1yc1pWZExVVjBFNW5vWUZ5bkNzRXV6cDBRNWhEVUJ3WERa?=
 =?utf-8?B?QWE5SktkYnBMbHY3aXlGVTIwNkN4NXZ6NWRZaU4xRm0zOENHY2ZCbWRtZHMw?=
 =?utf-8?B?cm9Fa0hld1lCZjgra2thTnZKeGpBSm1VL1J4VW1sVFg5Y2JPV3FZVTNlQWQw?=
 =?utf-8?B?NVBFYlNmRWx2TFV3TTQzWnYvMk92cFFNUVNSdlVzUGRlQitSN0ppQnI0MG84?=
 =?utf-8?B?dWNkdmZWL3Z0a0o2a3FEenpxTHJnRCt2WUsxNmZCMEZFRmVpTEhiZXBzODBE?=
 =?utf-8?B?NnZHTjRyVTh5UXo3WjJQa0RWN1FvZEd1SjFseVVMSVFZd0RIb1F1c0lFSVkx?=
 =?utf-8?B?cTlQUUYvZHZNY1R5dXZid3dPeGxDQmpBV0xNczcrV2J6MzZPbnMrZ0JpMjBz?=
 =?utf-8?B?U2pBaVVpTmtVbXNBUUhqZEVRYk42MHo4NExyNFJEVUx0a1IxSTN1enl4cGpB?=
 =?utf-8?B?NjVwanBTOVhya2VmeGI2ejNGS3JBY2libE1Ub0RHOEpySnBTbkUrN3YyT3FS?=
 =?utf-8?B?R3hISlA2NzF2SnExVW9EMHdRclVlVDBjMmEyV05YQWlBSFkyNWMreVdjeDFt?=
 =?utf-8?B?dHNHRlRadDRnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca8dddeb-78ed-4ace-afa8-08da03573337
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 12:03:49.2682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /uJ9oXokiNvGUQ82EpXBqz+EsHz88rWGuCh5Udgx5WVZMBXj6cpXIwuPCORgfjShIPydP21iLVAl05bvkz8IfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5649
X-OriginatorOrg: citrix.com

On Mon, Feb 14, 2022 at 10:24:49AM +0100, Jan Beulich wrote:
> Calibration logic assumes that the platform timer (HPET or ACPI PM
> timer) and the TSC are read at about the same time. This assumption may
> not hold when a long latency event (e.g. SMI or NMI) occurs between the
> two reads. Reduce the risk of reading uncorrelated values by doing at
> least four pairs of reads, using the tuple where the delta between the
> enclosing TSC reads was smallest. From the fourth iteration onwards bail
> if the new TSC delta isn't better (smaller) than the best earlier one.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> When running virtualized, scheduling in the host would also constitute
> long latency events. I wonder whether, to compensate for that, we'd want
> more than 3 "base" iterations, as I would expect scheduling events to
> occur more frequently than e.g. SMI (and with a higher probability of
> multiple ones occurring in close succession).

That's hard to tell, maybe we should make the base iteration count
settable from the command line?

> ---
> v3: Fix 24-bit PM timer wrapping between the two read_pt_and_tsc()
>     invocations.
> v2: Use helper functions to fold duplicate code.
> 
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -287,9 +287,47 @@ static char *freq_string(u64 freq)
>      return s;
>  }
>  
> -static uint64_t adjust_elapsed(uint64_t elapsed, uint32_t actual,
> -                               uint32_t target)
> +static uint32_t __init read_pt_and_tsc(uint64_t *tsc,
> +                                       const struct platform_timesource *pts)
>  {
> +    uint64_t tsc_prev = *tsc = rdtsc_ordered(), tsc_min = ~0;
> +    uint32_t best = best;
> +    unsigned int i;
> +
> +    for ( i = 0; ; ++i )
> +    {
> +        uint32_t pt = pts->read_counter();
> +        uint64_t tsc_cur = rdtsc_ordered();
> +        uint64_t tsc_delta = tsc_cur - tsc_prev;
> +
> +        if ( tsc_delta < tsc_min )
> +        {
> +            tsc_min = tsc_delta;
> +            *tsc = tsc_cur;
> +            best = pt;
> +        }
> +        else if ( i > 2 )
> +            break;
> +
> +        tsc_prev = tsc_cur;
> +    }
> +
> +    return best;
> +}
> +
> +static uint64_t __init calibrate_tsc(const struct platform_timesource *pts)
> +{
> +    uint64_t start, end, elapsed;
> +    unsigned int count = read_pt_and_tsc(&start, pts);
> +    unsigned int target = CALIBRATE_VALUE(pts->frequency), actual;
> +    unsigned int mask = (uint32_t)~0 >> (32 - pts->counter_bits);

Just to be on the safe side you might want to add an assert that
counter_bits <= 32.

Thanks, Roger.

