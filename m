Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BE544E867
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 15:17:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225262.389009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlXMT-0004yu-BP; Fri, 12 Nov 2021 14:17:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225262.389009; Fri, 12 Nov 2021 14:17:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlXMT-0004vU-7M; Fri, 12 Nov 2021 14:17:01 +0000
Received: by outflank-mailman (input) for mailman id 225262;
 Fri, 12 Nov 2021 14:16:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=26E1=P7=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mlXMR-0004vL-QF
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 14:16:59 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 306e35e8-43c3-11ec-a9d2-d9f7a1cc8784;
 Fri, 12 Nov 2021 15:16:57 +0100 (CET)
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
X-Inumbo-ID: 306e35e8-43c3-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636726617;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9rx/3rYsSDkhCDq7zdNyYN1I39vtXo0M7nvNwOYZwkI=;
  b=bv9Gg+iRwQimHTBzS4VMbLXdw1WPCmjmy2qdYddbcDn0bzAQHwmLdJ1u
   DzXeDFNH2neRBkIpZY6rFzUGyB8YIp2D5SDWbZ14PIuqBNp+jqrAAbD3A
   Y/jXmaksAXPaPooeBaj7dv5DQsRGtErUQrjJ35sHkM98NYHjGbLI16Jda
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: s1fUiSJ/3V/uFtpwoATM8bO8STehSK+IgAeqSGnLmj2/eWteB5XeP6MZLUhHRg44/kEc6wspMQ
 WT3cwCRcOachcCTMhoK4H8DVxkH/a6jan3jBnt6bk6cgiKpEw8p2aPfyPIKxmjwAr92EH/GvRa
 49AE90L+G6Y38Br6Ceh4s2dA/FGKXwx3PL0j1fkTE3ouWNhFy4bdN25zFY6sbP+kFGPxIWT26N
 dZVyvvdUvDsYzEgOKsZaA1Nod9LWs+c16d2ZIGzAejoZ2PKyhELIxsN8UAyBmYFGv7n0mHkDD1
 blP6gsqNeJaXPlEL/CMUxR5E
X-SBRS: 5.1
X-MesageID: 58076684
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:DQfnn6l5TWqfya9JvrRwgfXo5gx3IURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMDW+FOaqPYzSgKYwjPonj8ExTvp7cyNZmSgJvrC4yRCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg29cy2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 P9nlb29FF8qAqrnvrwUCCFmFCp+OJQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQKaGO
 JRHOWYHgBLoTwRCMUpPULMCotz5vVj9NBxAmFu7nP9ii4TU5FMoi+W8WDbPQfSLWsd9jkuev
 njB/WnyHlcdLtP34TiP/2+oh+TPtTjmQ49UH7q9ntZ6jVvWymENBRk+UVqgveL/mkO4Q8hYK
 UEf5mwpt6da3FOvZsnwWVu/unHsg/IHc4MOSatgsljLk/eKpVbCboQZctJfQPYMlO47GGQp6
 liiuYvgXgRRt7aVTEvIo994sgiOESQSKGYDYwoNQg0E/8TvrekPs/7fcjpwOPXr14OoQFkc1
 xjP9XFj3OtL0abnwo3ipQif6w9AsKQlWeLcCu//emu+pj10a4e+D2BDwQiKtK0QRGp1o7Tog
 ZTlpyR8xLxRZX1uvHbUKAnoIF1Pz6zYWNE7qQQ/d6TNDxz3pxaekXl4uVmS3ntBPMceYiPOa
 0TOow5X75I7FCL0NvEpPtzrUJ97kPKI+THZuhb8NIcmjn9ZLl/vwc2TTRTIgzCFfLYEzcnTx
 qt3ge7zVC1HWMyLPRK9RvsH0K9D+8zN7Ti7eHwP9Dz+ieD2TCfMEd8taQLSBshkvPLsiFiEq
 L53aprVoyizpcWjO0E7B6ZIdgtURZX6bLirw/FqmhmrflA7RTp/UqCJmtvMueVNxsxoqwsBx
 VnkMmdww1vjn3zXbwKMb3FocrT0Wphj63k8OEQR0ZyAghDPuK6js/UScYUZZ74i+LAxxPJ4V
 aBdKc6BHu5OWnLM/DFENcvxq4lrdRKKgwOSPnX6PGhjLsA4HwGZqMX5egbP9TUVCnblv8UJv
 LD9hBjQRoAORlo+AZ+OOu6v1V64oVMUhPl2AxnTOtBWdUi1qNpqJiX9g+UZOcYJLRmflDKW2
 xzPWUUTpPXXop9z+97M3PjWo4CsGup4P0xbA2iEsurmaXiEpjKumNYSXvyJcDbRUHLP1J+jP
 egFnevhNPAnnUpRt9YuGbhc0q9jtcDkoKVXz1o4ESyTPUirEL5pPlKPwdJL6v9W3rZctAa7B
 hCP991dNenbMc/pCgdMdg8sb+DF3vAIgDjCq/8yJRyitiNw+bOGV2RUPgWN13MBfOckbtt9z
 LdzotMS5iy+lgEuY4SPgS1j/miRKmANDvc8vZYADY630gcmxzmuu3AH5vMaNH1XV+hxDw==
IronPort-HdrOrdr: A9a23:9YQ1I6AHwvrt3CnlHeg8sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6LW90dq7MAzhHPlOkPUs1NaZLXTbUQ6TQr2KgrGSuwEIdxeOkdK1kJ
 0QCZSWa+eAfWSS7/yKmTVQeuxIqLLskNHK9JTjJjVWPGVXgslbnnZE422gYytLrWd9dPgE/d
 anl7F6T23KQwVoUi33PAhJY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX232oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iBnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJDA4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWArqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocWTbqjVQGagoBT+q3oYpxqdS32BnTq+/blnQS+pUoJjHfxn6ck7zA9HJFUcegM2w
 2LCNUvqFh0dL5iUUtKPpZ2fSKGMB2+ffvyChPnHb3GLtBNB5ufke+83F0KjNvaD6DgiqFCwa
 j8bA==
X-IronPort-AV: E=Sophos;i="5.87,229,1631592000"; 
   d="scan'208";a="58076684"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ri/XkDXfmlHa2w+Pjo/pXWrU9cabnZddaub1wVRsrgik5mlh5dlsMZFExupSThCDo0/R4f9Pt+kY4P+MR8rZ1KWVaru13MHf25A6E7WOGA/zBFh57Mqs4HWf+/R4f3X2JXFTkkf9kPXoCwwINQp8LEe9bf+Sec1WUseCNFM939uKY0804xeK0mHZMVYujnHOTNiIF2BXRosVLLmBwPbuTW3TqaFtm6vhnWpnjJS8CMW3T9pfrlnAstHtc7CRoIEMeuC0Zr8Mqj+cHEovtPc2Yp5WNSJQQo/vXUE2NaILdhx5LLbTJKxHxeMpTuV5hXcLL2Nm0Yd1LICD8aKNc0sK+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5VbkS6BKgoeA4buEgq5xrLtgBXr2FVDsIdr+N0fBqM=;
 b=lIS8WPH8ilMJoUNWCV+mWxZLAk9jMEV/V9jP6dM3TWJMdmb41ey2gcOCU4t3Dr5Q64+6mujqZOEmNjK5e0hu4MlB45z0HmK6dpKDINbGLhtqbRHnNWlR74LjpCpLesrNTRxNHvgGb85LAvFr2NegTELyWB8bNlxXsFuBvcoci7KhaC2OIUp9/RchS911XiWl1FabvLPom9IwUPfCLl+j4uT0AnMd15wmowMS1pp7WnkDvxqXQ53W+QVJ137HGEGAYNZFvo7T4Lmhm+PTz1W89ueB6BT6Kp2o/qt6GN85bS+4nX+sP/TmqG+ucdXwTStm/7joS8i+k6bOTu25DnCk6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5VbkS6BKgoeA4buEgq5xrLtgBXr2FVDsIdr+N0fBqM=;
 b=p1fsQ/E76CGX82qsNeTcbJfRsAu9A3Eo1l7cE9ATQXPTd8RH0lZssJ1BKqT0bC99tIIJmw2JiaV6Rg5OwCL2HY3n/MHMj7cO0J4AlYgTfF2F2m6ThsJktau9++mpS2Wo4lI1STyVQ0+bq8qGRnRNFL+5K/RI79B1J9nUZ5NzzeQ=
To: Jan Beulich <jbeulich@suse.com>, Jane Malalane <jane.malalane@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
References: <20211018100848.10612-1-jane.malalane@citrix.com>
 <11747958-dc2c-270f-6f96-4d9f53ea724e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] tests/resource: Extend to check that the grant frames are
 mapped correctly
Message-ID: <b1377bd5-fbc4-0c19-8abc-e63ef126504c@citrix.com>
Date: Fri, 12 Nov 2021 14:16:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <11747958-dc2c-270f-6f96-4d9f53ea724e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0313.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49e47a26-fa25-4cb7-0ddc-08d9a5e710f9
X-MS-TrafficTypeDiagnostic: BYAPR03MB4487:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4487B401AF4031CAFB14C29FBA959@BYAPR03MB4487.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:33;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S2ZPbt5jYvlcrVPB5k9wKeiGXTHujgUBtP87YVBG879E0F1H5Ur6Vz6S5prRSCUObCwyZ9983UrAAzHfV1zyhXKQxh7QeEhfrB1NZBgomO0dl0Zwdxk2fbhzk9CBCkJ3ultlW91y3xZdMhlY6uoArEfK0YQaVubqCxA+pzUfVEyf8vptamRXuFEH7Mgfu+33qwBzKr4oPdsWNAL9aJJdZXwXALJZJbVUXZZtxpz8c6yjbA6BeZwhcZ38G34MCsjD4r5py4I0aA+P+miGSs4c34bVJO9ZU7h8qy7iu//og60PThhwnlJ0lbYtPKmBA9VAZIzikkXDR8ZXCSFer7qM2uLRbkBP8xn5VOvJtWopSji5nXNLzctJ5UIzDANb806SlCOlRiPdNirmMOkYDK/xxXmQyLqZkfBBAtY3fsIi5v43yHk1P7Vt02xZroFl7rzIJ+QVD/J03b7x7HQ73AFvwVcdi3ghi/TEx8fB2OAclnYAgIROxb+FbceYEaxQaui09j4I7NwUlmotg4woa66s0ULKXWLKobrY5A9HbeTNwGVAPcIzzylC0tMNJYnHGPOrMJ+rF371rbqR2kQPhDEDJtS1ADvuU4cK4GbBc2ICDWhf96mL3EOwSQXWDJnXPCga5//Ng4yx/upEoZOttl0BCAAaBl/CDQ7eAJVIpw+vqRMXft2fh6UO+E4rFaC0ljaDT5ks1IrCNF4girUxn8S555e8T/hHzr8uc5d1MLIBVek=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(186003)(8676002)(83380400001)(66476007)(4326008)(26005)(6486002)(82960400001)(31686004)(8936002)(508600001)(5660300002)(2616005)(956004)(66556008)(53546011)(66946007)(86362001)(110136005)(16576012)(316002)(6636002)(31696002)(36756003)(54906003)(2906002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TSs5ZWpqWm9oaTRWRTNvS0p6OUVmMEJ0T2NCZ3IwaHZUSFNtZUl6ZndlYkFF?=
 =?utf-8?B?RHFuRlpIYTNKQ1Zwbzc2eWVzSVRldmVJQ0tmNWxhWE5MekNMdDhFNVdLRlJW?=
 =?utf-8?B?bDhLdEUrdXdXcVBVSnBMUVlUZkt6bzd6OWVndk9OSC8zdDlHVkJzLzZVQmJ1?=
 =?utf-8?B?ak50UDhLNFVmMFhjc040dnZjaE1BV0VSbTNhVVR3SG9oWEdSMytQYU80T1lV?=
 =?utf-8?B?UlBhUW1jb2lJTUF2ZkViNDZPVHBvV0l3U0dxSUpOWTFBS1FJWlZBWW9VRVdB?=
 =?utf-8?B?M2xtbitFOTYrM2d5aU1JWVdQcUtjL28wUUlkZTQ2OWJUOGlxOEd0elg4NjlO?=
 =?utf-8?B?NVcvRnhSTmNIbjhsT2tNSDNncWljZUJJbE1tRERzVzdyNWJhMVBackJnVXFt?=
 =?utf-8?B?cFhzZklCQVZFZlNEc3loNHRtYkFSc2N6ZnpKN29aN1c3Y0tmWGtVWDIrc3U4?=
 =?utf-8?B?YVoxcWRSRFhqZFd3WEZRSVhWU3c1Vk1oL2txK01SdGVHYnM3V216WWtheTlq?=
 =?utf-8?B?eUFnVk91ajZJVVFsV1l1UU9aQkw2dzZzd3JmdGphdUg2Y3hHcTMxaysybmxl?=
 =?utf-8?B?djRDZnRSVjVxaWtrSmQrWXYyREFKQ21haDhEdWJMWkdjTXpOd0xkTUNqcFps?=
 =?utf-8?B?NUljY3NQemQ2QkJac1NHblZIaDNPYmNPTEtRWFMrK2F5dE5lakRpZVV2MTJY?=
 =?utf-8?B?S3hqT21lNURuNjg5Z1ZRZDY4Y2dCMVpRSEZiVG1GYk5BbTFJZHN1NGdGWVVW?=
 =?utf-8?B?SmlWSFVtWEhDU1VoTTFqT1I1RUc3U3JINkhwWWxMU0ZremxnWHhzTGxTL1k2?=
 =?utf-8?B?amUwd2hadjJTNTJBTlYrL0gvU2w0SXlVdTY5akhWQ2xQMkQzZFVvOCs5bDhV?=
 =?utf-8?B?L3FkSmFsVjd6REw4djdZVGw0cjhqYzA5MVdDUStKUDc3d1JtUkNTNzdKTHlE?=
 =?utf-8?B?V3RKWjlFQ0VxdjJYdlh6QUZzdjFFQXEvam8zeWpqZTR3c3dNN1Z0Tm5XMGhF?=
 =?utf-8?B?eFhCN3pPWU8vd2NUUUdFcnJ2ZjhzNGtRbnYxNC9wKy90Sys0SzVQdFQxYk56?=
 =?utf-8?B?T2dNS1dlSHBzZlNPN1g2R0E3RDREY2gzeUdnM28wZjA4d0VaNXBCc2t6eUgr?=
 =?utf-8?B?MVQyenZDMVAvbnFkOU4wZGVXeFluUkVNNng2SVpsQzdRQU95UDdnSmJnNkxO?=
 =?utf-8?B?WjJiWlBiK3JIbHF2UGlwcThWVnprS2g0d1NaWnc2elVTdEZaSUZoNXVpQjN5?=
 =?utf-8?B?cUwxYW92QTE3OWQ0T3ZibFdkR3MxRnpsaXhYdVloOTVxdm92ajJkUHhYZUlu?=
 =?utf-8?B?dGI0M0dYQTdZSGxIdGxBM1NaQ1NJQjBFRlBZK1p2cnFkNDRLRysydVBQQTIy?=
 =?utf-8?B?VlhqSHF1QUNYOXgySU5SaWNhNk1DL2RXaFJRY1QwTTJUYlBaSUg4MkFuRVI4?=
 =?utf-8?B?Z3NJRUxSNzdGOXJzQS9SMkYyTlV6a0VmY1BzZWdTZTUrRVVlY2ZaUC94V0xa?=
 =?utf-8?B?YlkyVVlHR3N0TkpYVjNwWkF4blpURk9DZFhvd0ZyTmxjRURVVEVQQUhSNXZu?=
 =?utf-8?B?OFIrZ3c0VVJLcFhNaVk2ZFhQNHdnUGV5M0xKcElaR1pmZUFtY0IxeTJjQnpI?=
 =?utf-8?B?WFFqN3kwMDlwTitIWUl0aGZNcUpWaFo0Q25EdXBrc05SSjZrVVJPaDdGRlZQ?=
 =?utf-8?B?YkFtcW13UHowK3hiNTlzV0d6K0hmeUNkZVVhNWVEckN3b0lsdUdpMkxvMTZu?=
 =?utf-8?B?UzY0dnBxdG8xQlR5U2hDWkpxVFhJby91bmM3VVg4VDYvam1oYjY5QmE0RitM?=
 =?utf-8?B?Q2VrT1VhTmhWSDFnS2pKZk9VMTBjR2lMa2M5Q0VrTWcwSlh2NXl0eVpzQkNE?=
 =?utf-8?B?allramhlemFxckFZK282ZHJTUklMWERUd21TcFlRK2hOQk9jZGNJOVFiWWxU?=
 =?utf-8?B?TE9zbnZObkRNYVRERmNzTnBjeEdCaEhwbmtEeHVrdXFTSnlSMFVCRnlMeE5N?=
 =?utf-8?B?dy9DTzVNYzk5d0FrNTEwZjh1RDc2Z3RGM1A2azNEMGJkUGhYYjlMYko2aElI?=
 =?utf-8?B?emxQRCttNSt6US9oL1UzV3hIYVgzT21iR3I1bXRVbktZYTJWdTQxQUhFbjJO?=
 =?utf-8?B?K28zSFNlQWtXUFdPRXpqOHdGeGU4djlCRFRQWk1JSmR3ZWw1b01VcnlXRWlC?=
 =?utf-8?B?SHR5SWpHRFFxZHdNWk9SQ1ppL2dsS3VDZEZDa2UxbVlRRmMwU3VHOWlmSER2?=
 =?utf-8?B?V3JZdUpVOFVpaGJJdms0WFRGY0tnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49e47a26-fa25-4cb7-0ddc-08d9a5e710f9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 14:16:49.2320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5NiE1JMGDNk+1/DP6EILi0rNiI9cCFF//jOUWtBrjv4ge1MIxM1kfCda0w7dn0PsifY14tYbtvb3NIKXyyZ4lEvBhCehZrONL+oPTzr5izM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4487
X-OriginatorOrg: citrix.com

On 18/10/2021 12:01, Jan Beulich wrote:
> On 18.10.2021 12:08, Jane Malalane wrote:
>
>>      /*
>>       * Failure here with E2BIG indicates Xen is missing the bugfix to m=
ap
>>       * resources larger than 32 frames.
>>       */
>>      if ( !res )
>> -        return fail("    Fail: Map %d - %s\n", errno, strerror(errno));
>> +        return fail("    Fail: Map grant table %d - %s\n", errno, strer=
ror(errno));
>> =20
>> +    /* Put each gref at a unique offset in its frame. */
>> +    for ( unsigned int i =3D 0; i < nr_frames; i++ )
>> +    {
>> +        unsigned int gref =3D i * (XC_PAGE_SIZE / sizeof(*gnttab)) + i;
>> +
>> +        refs[i] =3D gref;
>> +        domids[i] =3D domid;
>> +
>> +        gnttab[gref].domid =3D 0;
>> +        gnttab[gref].frame =3D gfn;
>> +        gnttab[gref].flags =3D GTF_permit_access;
>> +    }
> To make obvious that you're done with gnttab[], perhaps better unmap it
> here rather than at the bottom?

This is just test code.=C2=A0 We could unmap it earlier, but that makes it
irritating if you ever need to insert printk()'s.

>> @@ -123,8 +162,25 @@ static void test_domain_configurations(void)
>> =20
>>          printf("  Created d%u\n", domid);
>> =20
>> -        test_gnttab(domid, t->create.max_grant_frames);
>> +        rc =3D xc_domain_setmaxmem(xch, domid, -1);
> That's an unbelievably large upper bound that you set. Since you
> populate ...
>
>> +        if ( rc )
>> +        {
>> +            fail("  Failed to set max memory for domain: %d - %s\n",
>> +                 errno, strerror(errno));
>> +            goto test_done;
>> +        }
>> +
>> +        rc =3D xc_domain_populate_physmap_exact(xch, domid, ARRAY_SIZE(=
ram), 0, 0, ram);
> ... only a single page, can't you get away with a much smaller value?

Yes, but again, this is test code.

Furthermore, there are other plans for further testing which would mean
1 wouldn't be appropriate here.=C2=A0 All we want is "don't choke on limits
while we're performing testing".

~Andrew


