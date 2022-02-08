Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8249E4AD58F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 11:40:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268040.461811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHNuj-0006Kl-66; Tue, 08 Feb 2022 10:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268040.461811; Tue, 08 Feb 2022 10:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHNuj-0006HU-2j; Tue, 08 Feb 2022 10:40:01 +0000
Received: by outflank-mailman (input) for mailman id 268040;
 Tue, 08 Feb 2022 10:39:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nHNuh-0006HO-6L
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 10:39:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75c50817-88cb-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 11:39:57 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-bkYSXrkJOm-zpi7vNX0q5A-2; Tue, 08 Feb 2022 11:39:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB8PR04MB5916.eurprd04.prod.outlook.com (2603:10a6:10:ac::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 10:39:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Tue, 8 Feb 2022
 10:39:53 +0000
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
X-Inumbo-ID: 75c50817-88cb-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644316797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=We+/9PJvRCZvDc34BOX57wPXZ59QeRYsuicLvS49KkU=;
	b=CJcotAq9D4Lsm7lYI4aR6W8L4Rv5tCs2gYF7cJm7nS+ZRWVtYwrQJRD+4+BWSd9ugzQAg+
	4jRlYTKf9wg7qWarkrIEzmkLs+dah3/q9ay23Vh9L7C/MyeH80hmIjsAMvLoPMIphhyfTL
	BINzHjqpdu+Y2oeDTQgkqD2IDj3PDRg=
X-MC-Unique: bkYSXrkJOm-zpi7vNX0q5A-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Al7ztWm55OAJZtndDyuhvKXxB2L8SJGn+M91jN7Sv52IORRyu/l1EqFJ5HTk5l9aPu7XRU2vf4DtK74ZKbaYOZiEVtT5/r6MpNR249pPDm89L5uRRSdroJ50NLMSAIpq+2jsHV47CPLw2zRNRKrASgoFldYahtYHTRWE5y5iIShqwqggDyln+4uyG4f+jXqgAWTUPwdAB6zDgdJbrqt6svax4OT7oAk/7cJF6PcJGgyZXK82x2/HEUL0zkeZ3Y7fJoTMGLq0sYJJ4oOJj5hPuzNLQRBtaDLS2oEe4Flu8nHkOUT1mRGpNxdpthJ0ynoH9RBEw5JhNYFSmTf5zwAvQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vd1VaDjpbI2hRQzr5iRCea8XSbAtrqZ6+wGWKwIkp/0=;
 b=kpfl+kYtS+sGnEYTiQHHlkToJCyO8ZUtKIgR3OPBDIuyt0CX8dGUGPOXjAvcahlgO6MixnyiXldN8WEAMrQwGWZKAkCUkgPqBmBdwrH4eI1N6t4MLWQ5pjQwmkGahA8AwJlYIWNu+wCh7C64JZkuD8KfgX2ER9h4jYeCO2E6qMPfD47ejwv7qdcJ6AsYh7MDyjkTeic432FZZ1jKVNVqywIRXBLNEulYunFL1EDTsaOlQ4b9jhzNl78ziuodokiO1NXSOGuXHxIf87AUPQOWlb7e3hp2kt5Zz99DQwCkCpprmy5gXL2XeFlqBtVbnM92JDjt1stoiKgtkiIHvQLYHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2b78482c-64fc-e608-b8a3-f906c23420ba@suse.com>
Date: Tue, 8 Feb 2022 11:39:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] xen/smp: Speed up on_selected_cpus()
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220204203115.13290-1-andrew.cooper3@citrix.com>
 <613d2033-47ba-1f67-9d90-322caeaef5dc@suse.com>
 <7805e1a3-e80b-91e9-afd3-aa3b1f93afef@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7805e1a3-e80b-91e9-afd3-aa3b1f93afef@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5P194CA0010.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05b337ae-feb5-46d5-7974-08d9eaef5760
X-MS-TrafficTypeDiagnostic: DB8PR04MB5916:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB591653A9BBE85EBC48C0CCC8B32D9@DB8PR04MB5916.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S0404qK27pkQS8mNP8zFkN/Id0/WarsZWjjyqjw5Ejv15wFIWxxT4PpjxXuELgdvnAezf/ZkJifY/RYLn3k8pHMoFt0x+D+bWWgrsWtG8wKgG5jwl9FWjw643GsK7x4rpbxchUM7/ejyKUrpJn62UcMjQS+Zs6Mrb68zoz/BsVjxjoY4j/VjKQTd+rJ2/OmAWyhWpIW/3ddXLXIrRlU66/a4KUduf1vySNuWB3WMN2NC0WkIKK//1O4EYlpKeYtPg1bNr0OxLWov2kzT8B0eH8Lk/LmJcDxSLVe1XaJwbU767NWtj0VxzDSWmtXG7uczdDwGnUdG4aJ2gOHfcnE/M0HM5cUNwDvApcGyQeTCHudXL2+EFuQ6fIfbMPTtUkXjvCKljFtN91cetlE+Zz3hd36cVSi2FFXVkXyWXjwQV9Vlvayt7QPszJPaCwQ2aUfg7s2Vj9WGJt1ZGAQ4ywy6gowzaOL5u0pYKWDA/R5L1Gn5S4rAzRN7N5gR+hiCFvsaD9e+mCBNJYj4J/nm/xpPXrpoOuvdyHFk7hYpb6m9mzds2/OmuKV3VLo5RGKENf5nUVHyFhpuISLKvA1CHE1XTsFMo0a3xJrG97csKfC5DKIxedb1aS8Bk3804Q8ke07t8i4kMjUbmyqC6wSkuF03AkrPZmW+NXpTjELWF3f6+GvEHQ0kD1Zftcvh9CvppDOHj3pWJ9Wz+DAGM/rLSjzrloWMI+RaOb1LUn4SluKaHcM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(2906002)(26005)(186003)(38100700002)(2616005)(31686004)(6506007)(86362001)(8676002)(8936002)(66556008)(66946007)(6486002)(53546011)(4326008)(54906003)(31696002)(508600001)(6512007)(316002)(6916009)(66476007)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HzVwPqA+ev8fkugXVngptpt1Z97gyuGWUCbkxvx7aXwraNj1pZdGCCk+WKUN?=
 =?us-ascii?Q?+II/VsE4kdOWBxb4ELmXNzGBAPYqhvsilNWProA6pAV8djontLgd4jy1b6lL?=
 =?us-ascii?Q?aF/7prN29u0AVOK6Ix9aaIwgL73jfo2BdMcVYwpZ7ZYOly/QodZQdlH5gj2w?=
 =?us-ascii?Q?yR+Ugo5qVddFTCbY35ZMT+emDZMldWAxuJmKm06mCh54hoXsmsG4yNPc0Hku?=
 =?us-ascii?Q?kY7zKCW+tNmGKNbVE4UZRSDxhQwhm+tI/WyJH9tO2Sw1GFeLIrWZWhE0h+kI?=
 =?us-ascii?Q?9jUnOQkwsMAOa/DiC7p31a6/INJQuSVEI8Ur7xAJKckyBUT7hXHmqPGYQc8w?=
 =?us-ascii?Q?U45O1rPCV0QgsrtKj81NXMXiVxVVra+BtcSVnnAUPVITFTAHVLkqfmw1wvhs?=
 =?us-ascii?Q?vsiuLy1Rj5ZLgD82AKrKoyKInZy21+OtYkQszJ/8xwTuWjk2agocnozxJoM6?=
 =?us-ascii?Q?Bog+1mFSKjKBpU4GYGBuXVX8UVkS8FGdUSGRT5Ta3134mWO24Hgd9Frn9hZp?=
 =?us-ascii?Q?HSHPqxweW36NjhDPnNFYELc6pBXMUD/EEgXeqy5Z/55+KxBkAstlOXB2hMvw?=
 =?us-ascii?Q?nOD1FuTHN02XspOgh4lL/SVB6tVyNIikh7h0oma5NqYUm95kM2yvRZ+SFGfH?=
 =?us-ascii?Q?id0+4PPY3xwCDHGfeeZYTbs8l0/5hEWh+cPTKRBH2EuNuSAov4pwIrXlEEj0?=
 =?us-ascii?Q?L7hbGs1OYfTqDKoCnyD49TSEzwG/qzL/BJ0/3ayuRPyBvzW6/l7fmVSvoMkz?=
 =?us-ascii?Q?dEdZOwTm5ync8Adq9+FqPzbzLU4wGwgbuT3F0RjY/IKMVnj/q5IthLunbmCl?=
 =?us-ascii?Q?qqvceBfpco7n8hFFIoyk9pDeePm1SInF5uOAXyB0medbUKNKDO63T2ASbiG7?=
 =?us-ascii?Q?HxNURnk+0wlHraaL9cqai7xaEwCfYa8K1jQ7JONGISDYJusqQWieROqxOHXH?=
 =?us-ascii?Q?xkPEljW7h+HKAOdJfKeCct5Z/uu3jrVwmYrvvP2zG1rhxc9j3xsBoQyc80el?=
 =?us-ascii?Q?IuS1wba2C9uiUV4QfCnkoe1toOTpfpOpDLAVWsZOFY72pAPqwK40xXLlfHvL?=
 =?us-ascii?Q?im7VamcaKYgOlhWw8IGa2IGyxlPfcq+vEzEIqZT9Jb1Wb6x6SqI2VTQiEw02?=
 =?us-ascii?Q?/R82XH5OGiPlsrPSccd4+bqY6ekJK5VSaRvYSoFYyKXTRNhkV32M8KszyzTi?=
 =?us-ascii?Q?gLwtzN0WBTe0LzTS2/lWXiUyoOVn98X4lcEMWDnfIOR/BbFJv8EmRVemIGgU?=
 =?us-ascii?Q?rtF9/r3FzPKoDmnNffjk5Q0R6MOGhsWdnM4+3szwumzePfDzFH4ZeQC8vpft?=
 =?us-ascii?Q?5ntFt2PSGgP8ois/dqJImiuF1grRsDGLl+gfeHsyqdkDlW0ceu6kLnIHt49d?=
 =?us-ascii?Q?zWBsCNwnW8ge7a/DhnHdYgObncFmlAdkGDZrzkha7YsceJ9g3rWYSan/TKNK?=
 =?us-ascii?Q?zjF6Ocq01m9Rw54lF4KNDnaKK2UfiGCBBQPDpVku6Y7iN4EMS7MuW14pQWGM?=
 =?us-ascii?Q?xp5D5Jh18z+gjD4o+iCDlEOaC357fxBnIEAVoEZHSF0xKE6Rih5rb3FPdEb6?=
 =?us-ascii?Q?V9gWPd4sZL5ddGU3v9cOoEcnO2qUsib/K9cG1YvK3jkwFC1qlT/jWVPHQ4tc?=
 =?us-ascii?Q?HChV0CmIGrQbINxiQAXfOvA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b337ae-feb5-46d5-7974-08d9eaef5760
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 10:39:53.5065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KOoMhzivXM6/eHIUvNuCnjnGyWf8bA6FRgYnfvc+SbxU12ixqltNSm4XfM2G9cwi3OcbeVE6TqlAfBkL6Ks+BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5916

On 07.02.2022 18:06, Andrew Cooper wrote:
> On 07/02/2022 08:11, Jan Beulich wrote:
>>  (And of
>> course I still have that conversion to POPCNT alternatives patching pend=
ing,
>> where Roger did ask for some re-work in reply to v2, but where it has
>> remained unclear whether investing time into that wouldn't be in vein,
>> considering some of your replies on v1. Thus would have further shrunk t=
he
>> difference, without me meaning to say the change here isn't a good one.)
>=20
> There is a perfectly clear and simple way forward.=C2=A0 It's the one whi=
ch
> doesn't fight the optimiser and actively regress the code generation in
> the calling functions, and add an unreasonable quantity technical debt
> into the marginal paths.
>=20
> I will ack a version where you're not adding complexity for negative gain=
s.

Thanks, at least some form of a reply. I'm afraid I can't really translate
this to which parts of the change you'd be okay with and which parts need
changing. I didn't think I would "fight the optimiser and actively regress
the code generation in the calling functions" in v2 (this may have been
different in v1, but I haven't gone back to check; I wonder though whether
you're mixing this with e.g. the BMI patching series I've long given up on)=
.

Jan


