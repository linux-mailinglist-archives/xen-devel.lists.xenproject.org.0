Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1533352A70B
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 17:38:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331149.554628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqzHV-0001PF-Q1; Tue, 17 May 2022 15:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331149.554628; Tue, 17 May 2022 15:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqzHV-0001MI-MK; Tue, 17 May 2022 15:38:41 +0000
Received: by outflank-mailman (input) for mailman id 331149;
 Tue, 17 May 2022 15:38:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nqzHU-0001MC-T4
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 15:38:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c750167-d5f7-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 17:38:39 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-XO5zcPlqO06LxzxBYAsfsw-1; Tue, 17 May 2022 17:38:38 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6920.eurprd04.prod.outlook.com (2603:10a6:20b:101::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 15:38:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 15:38:36 +0000
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
X-Inumbo-ID: 6c750167-d5f7-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652801919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=avMjyL6waKTXUjMCXu6p+BDuwirFXMqx+T+cx6+YXLA=;
	b=mMMUbX2Og+fFQyeNczGJmxSRAhs1XA/96q/XOoTU2FwbAEVOD1yCX/EihFQk940SKd6KZp
	Gy5wOGz0u5QuFXt2v98h2jrKtgoWgZoJBk25oYMqy1NcYnxN8/dGUwyFHJFh/WaPN3KIBF
	k9S8Trl1xVQk8+XGHzZCmyIONKw/pOQ=
X-MC-Unique: XO5zcPlqO06LxzxBYAsfsw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EbawRrsH71MIZ9c79r3vPuAyxpZUu7sJLqqUHMjDUdk300yu1eFQv6/AQrLln4hDthdJRXAKWdOVlYYgxZ094HJu/arVWc4SvXhU9X2vmG6X5p4hpr32TdgfeFtEoNrubQWs6KdkXYgWQF0JfuDQmcIe0n7wGO96s8F9A8jOADdeKvNPBc7em+Y9A5a9IPZ1+WaIrnm53WkqrPUzHLO4c14C6Yo3vMH5DjODOQ2kCvtBIvTXDjfBD5D/YcskROlN3n8EsG87RBtsZswdWohz+BQOFO8Ma1MBYQuTN9y/nF+JVbYelUBK5h+KVNTeAe3QXUo3fq0y1Bi+4phEsDJvwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xj5h4ued3T/BrsnWxIuy2EZy8/aYVoChYZR3tKstO8=;
 b=d5viUImJjFGfvBtZFKFYmeHv0c/eBbiiLQL2Ighc8tcb3R4L6C2SLxW5qizdFoXjFFU7b/7nY2fCZXxmnd5ywx/fo5RyEoODfa0/tq/8jINc/wvvvVMze52scaRFhA/miPH930FjoXhfG9oOVJiCq6qKNe0O0m0HLYIFE8WT1s9W9imIK5dpO8Fh/DGH8PolwTDZEfG72No18AS9urlq7eDwk6Lh+l6mG4LOzqkMBWE1rPMwps83vSnPn3vYH284wbLsB8G3QqIcp+MWBsxTqw7xWkv+Fsow9dJd88eG5YcR/fW65BSCsEZvbnT7UWwFgu/NOk0ELRe8RuczHFOJ1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <000745e7-0b0e-386e-861e-901319defde3@suse.com>
Date: Tue, 17 May 2022 17:38:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/3] x86/p2m.h: Add include guards
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220509122409.14184-1-andrew.cooper3@citrix.com>
 <20220509122409.14184-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220509122409.14184-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P191CA0080.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7706950d-ff70-43aa-df18-08da381b4f0a
X-MS-TrafficTypeDiagnostic: AM7PR04MB6920:EE_
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB69207DCF5C74EC15631D15DEB3CE9@AM7PR04MB6920.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	geSmrkMMAx6qePTckAbW4fn1APLJtk4nAT21bOfJGPUV8VFuaXwl2IkliDS9yQ2+JpVIZ5fsmdDod1izBNwA+LziUCseif6TvuMJbyi5wI11waovVqomz4AP7C1Rhg4Ee2aQjA20MCBi8VGH2EJlpLUuPeq0yqkMyVoo7Hyz81xu20n9oBb9qgH4EKvLui/S4Xgf7R6dVIHEUf4MMIvkL6OI2XXlJ2kNwwzc7P0cz6w4xoK7eFXIjmU7KC4KTYtFFP37j8XCjTv7RNEid60A45VorlkqAVKbZ8zdK8i68kfeSb7S17btod49vnHlA9V+rls/Ok4oapt29HpJKu6DURT+6kxSmPZhP70KBPVyX7VAu6xdca6zF0HeRay+OANgAUDIGt5KUJpxPIVmxoVSsbqU1NhLBFnPXTLivH12uwZznqaUl5ef1nWkv702esD2v5nT0sUfyztqb0u/MlLWtqk9OW17xGF1KshQi/Df0wTj4GnRsFGJyWkfhhpcEdlicFh5f9HJL3hUWUQb44V9iNAHRz0YT4WBhthx91ij/UC6MdhzWRxfByQWGXnFMJIM1JOYCIhb0sNJZJZk2xcsAy4obFzd5jS8MDJVSHA7ZjER4WG9kcTLWblalbM+s/+Uu/e4c1uJriYe9Ii0+E5rSwnRIcwYIwrRMFVlmzFYR8Y8vW+r1EN+N+yK8jY3a1c+/sEvHZAgly7rzbFExOUIDY9r6TjJXTEBFjb24zwsMO279gA6a6J4VeuxtUrGTACgIBeU2wP387WAv5PjgXVDHWkynDZBsMJcvMsNaFhWp4KmEuFhpCgoUVTYfQKUAxsi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(8676002)(4326008)(66556008)(66476007)(2616005)(6666004)(31696002)(316002)(86362001)(83380400001)(8936002)(5660300002)(53546011)(38100700002)(186003)(36756003)(31686004)(6506007)(6486002)(26005)(6512007)(2906002)(508600001)(6916009)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M3RsfEAZ9yHGVlyUWWdRNmCenOfWQ9gqatPmodphUaxwKipf3T5lIzJ7DDWe?=
 =?us-ascii?Q?qbUXfQGCHeb2SAF3t+3nZRZm1awm6mbsJzpGK4cAvWJMvHO2VtokW6aXAKHK?=
 =?us-ascii?Q?5MuOUnGfjHcNZ3u4m22vmMr0tDVmyT4s82gWh49DiSL51yXrQbMvd+7717DV?=
 =?us-ascii?Q?AXz09HIvIEmSFmFn1fDaC7QhJdJUOFteYAh0Q7IEkpdIyr7o2b5nrpllsryI?=
 =?us-ascii?Q?Vjj/LrUdLIeoVfhfQ6USEYmTGIV8Z+vdE3gcnpJJjy3/UGywrpA0hneQ0E37?=
 =?us-ascii?Q?cQJ0pRb+GreoYZ9iAYkxWMS187j3QAfoZGbWFDuXZBFR7gaaoXniKXbBFJXc?=
 =?us-ascii?Q?IwmqKFqznfe5I32GTRLjnnhIPfN1hW0k+Tex1EvsnKHqM9ybYQnejeX8uJHv?=
 =?us-ascii?Q?poZQeLdcGyuIOkaUVz5Q4enO+YyP1WFkJt/9jH5sDloSSwImAWup2y/dXOxH?=
 =?us-ascii?Q?t9ddumEnCo9SqbbVHgpcgSlBkf+pEbHDvZ3yKhjG+kp7R5t4nzLVVixOsU5K?=
 =?us-ascii?Q?VPXBmJoEz6PBl2Dc1QY90nC28GTIUgSM5gE5m3Vhhqo7YmpmwDQLu1upHavE?=
 =?us-ascii?Q?XbsLNLaW3XBPaaX2TcZXDi4QtkxfxrCTlnM6/vqWonpt4YaHkSDZTW91fRbK?=
 =?us-ascii?Q?k/Z+qe1T4xHkKRvsIwLBS4o3EXlnxoABUeadp6m9S4AC/QEOnoSDCNMeEqyt?=
 =?us-ascii?Q?F0cvqWrkY0eJMJbeDCAon0ykdkW5K63AIepItE5cAYhn8EXqf5EAq0zwTukd?=
 =?us-ascii?Q?bvM60QJOtdYrBWOwmhQoi3iHrwN+Y8ByHEjWmwakD2MlmFFddFvsDgyGYGDW?=
 =?us-ascii?Q?wQ6avY3Rbc4mbKc1auNDhOn+Fu4J8TWoe7nkdtmtU2Plk9c/L++hSdezIAFh?=
 =?us-ascii?Q?utmZUmeHeC9M7T32RyOU/g2E1zvzlISATionwo2YdHg+1Pe59vBZJoW23gUa?=
 =?us-ascii?Q?umFEGK7ES6CYPoXyp2XZeMs2Vrq2rbY6JbwAoJ7yAz6BtYxce6wNi5AytwhH?=
 =?us-ascii?Q?tT+C5i1esdfQVnCDKBKs37GYEbDArIj9YqZsweVjGWKrzwrYkGypglKd8ml8?=
 =?us-ascii?Q?+O/0ShSuFnSjmH885sE1yN+tF3WTDw+RFXCeWlhusFeQd+318QC/1y/iJtMX?=
 =?us-ascii?Q?osdj0TU7IL/MpPcmZtiiEGOBuT5Iz4UG1isomLUc+cmUZxZBm+GGcZB+lvLt?=
 =?us-ascii?Q?xINQxHRfDd7X0J6pjOEZV6KKl0H3ndnu25qN5/xc99jl4eDKdpSg8XlDuy9A?=
 =?us-ascii?Q?Q1hthtrioSTPqBlNC4VwHFUcgM1YeNNbl/Pl5vOJJDmjMvl4mvsUIrO7S1BG?=
 =?us-ascii?Q?WuOzoMOZvI11KmfV8Un6AkRXBjZsx6tCfNaZBbIK0oY+Hgxp3vrtjtWrEYJV?=
 =?us-ascii?Q?4v7VVAy+ir3NsGhBo6u8FdZ4CWh6xha7/iKvko7ZmukYh2blFB+j1BsVp2ov?=
 =?us-ascii?Q?axafY+68fRUJ5mOz8x8xzGbwuGviXhnkrhZJQ1ffrOkdUMTypIJmcTy1fVMq?=
 =?us-ascii?Q?6rHhlogSiLYzggTl4lJ5W1n3b1Txj5/53jqugWT30OKSq4qzbH4Cx9pMWKpa?=
 =?us-ascii?Q?kVg8cWoEkq+5ra5AX0vxQ0nb+7ET/d2wy+3jsIHW8ps8e6H+dBPbcJs8aXcO?=
 =?us-ascii?Q?N3A2RY9EjEmrW+5Ko8n9TOBdiCeibhgVZCHMh7PrEfAa2ip+ILUu1uG8X9i+?=
 =?us-ascii?Q?Rj8pX4POVneFHgnk/qhqwAsbQWDfCMkn8nXdKDyqrCC7X9uQxKV0ibQA/ox1?=
 =?us-ascii?Q?Smnscyuipg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7706950d-ff70-43aa-df18-08da381b4f0a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 15:38:36.9137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N4QEgAqN84VSJnm0/KNdMrH1k6XEvrnZPG7WVUz8vF7SXKxdYwiA7kq5sxxZ6owPqsIAPbjtgfFGtha0W2ClDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6920

On 09.05.2022 14:24, Andrew Cooper wrote:
> Spotted by Eclair MISRA scanner.

I'm sorry, but what exactly was it that the scanner spotted? It was
actually deliberate to introduce this file without guards. I'm of
the general opinion that (private) headers not to be included by
other headers (but only by .c files) are not in need of guards. If
it is project-wide consensus that _all_ header files should have
guards, then I'll try to keep this in mind (in "x86emul: a few
small steps towards disintegration" for example I introduce
another such instance), but then it should also be put down in
./CODING_STYLE.

Jan

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/x86/mm/p2m.h | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/xen/arch/x86/mm/p2m.h b/xen/arch/x86/mm/p2m.h
> index cc0f6766e4df..dc706b8e4799 100644
> --- a/xen/arch/x86/mm/p2m.h
> +++ b/xen/arch/x86/mm/p2m.h
> @@ -15,6 +15,9 @@
>   * along with this program; If not, see <http://www.gnu.org/licenses/>.
>   */
> =20
> +#ifndef __ARCH_MM_P2M_H__
> +#define __ARCH_MM_P2M_H__
> +
>  struct p2m_domain *p2m_init_one(struct domain *d);
>  void p2m_free_one(struct p2m_domain *p2m);
> =20
> @@ -39,6 +42,8 @@ int ept_p2m_init(struct p2m_domain *p2m);
>  void ept_p2m_uninit(struct p2m_domain *p2m);
>  void p2m_init_altp2m_ept(struct domain *d, unsigned int i);
> =20
> +#endif /* __ARCH_MM_P2M_H__ */
> +
>  /*
>   * Local variables:
>   * mode: C


