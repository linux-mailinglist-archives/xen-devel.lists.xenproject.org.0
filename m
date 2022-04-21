Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A60BB509C60
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 11:35:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309967.526512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhTDD-0004cM-PX; Thu, 21 Apr 2022 09:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309967.526512; Thu, 21 Apr 2022 09:34:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhTDD-0004Zy-Le; Thu, 21 Apr 2022 09:34:55 +0000
Received: by outflank-mailman (input) for mailman id 309967;
 Thu, 21 Apr 2022 09:34:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nhTDC-0004Zq-Q6
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 09:34:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 037a809f-c156-11ec-8fc2-03012f2f19d4;
 Thu, 21 Apr 2022 11:32:51 +0200 (CEST)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2051.outbound.protection.outlook.com [104.47.8.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-t_bT9zHRN3SA4mjJYwbdhQ-1; Thu, 21 Apr 2022 11:34:51 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB3968.eurprd04.prod.outlook.com (2603:10a6:803:3d::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 09:34:49 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 09:34:49 +0000
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
X-Inumbo-ID: 037a809f-c156-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650533693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p4VU66fUJcTMBh60wtywcoqMZWupFABTOcQaLrKDbTc=;
	b=Z2oSGxhz2IqeAsd8LvFSy9edG5E+wI3Jv4bCuh8MboeCrhi6GHH5dsdLBQ39PM7jGDBM/D
	Lvp9ABUkyqPFRIWGtCrIg2H9ji6CWr6j/ZjfOWENhWHQStfqIwYlfufe8BAwX1SjRpOu2c
	fNe8ulwG0PtIDFTSzTlPhMG5xRxEhLY=
X-MC-Unique: t_bT9zHRN3SA4mjJYwbdhQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7b18MJ2tjOtQAHmMntqJECoK2sIktHZHhqygiwt2+ISpq7HpK/An4QJBRqB1KXAKprIF7rvCZx1QrCrBo3UVc5DuETkxZJwOIZUlCxqJoam/enhssX3QKYA6Jo7ryC/B9wpkBKFTXhX4nT3KjFie2wkoop/whqJ5T3pn6+MMOvzqrz0CDs2UZXZcHY12fYlQwpv6FvsGhqgcwD6E6c4FAnKue27uhAoGUyUfdaeEfmQdsVI1Ah+j6Ju8mdDT5WM9PhUAwUEgadiGSYVThb2bno01cP2OMobPQULWgwO4wVuvk37yMW+1ED+zPFwvuJHN9qtRvSusTFblz4ty3Znvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k68fuNs+Aikxltf9kuzUs8ZmRf7XM5WMesTjk3NmLn0=;
 b=CRaq3Zy760RfntonF9pFFQOlBB7CgQItvLY/PhliQhkQz/CBCuRsWU7ljUiuFfY81zRCSOQYkgwDmwfnYLCMcrrm82mXDeLoPMZDPJxM8b0mt08hZ++TfZdukwSyfc2f2QWTi+6GWjNcdI2Xtw/yGNjwHGfPbWiSJPMwunRRHOoGnD5uCVWmOWtIiw4u6jfgC2AYEy3LJCsDgUNwbvd5mBxD0EjRQg/Efm22sokOTKxyIe5o+sG6hPGQ3HaqH+qcTW0INnK/5ZkuIL1cyOeQHiWKvkmsQmxQozAgw46jkYG5c8AUFKyyhBFMvUvE0x4/9v30nUxsa6IFhfA1H7cvOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ff0fbea4-ac41-66f9-5440-88ae5d7cc188@suse.com>
Date: Thu, 21 Apr 2022 11:34:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 1/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests
 on top of SPEC_CTRL
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220331092717.9023-1-roger.pau@citrix.com>
 <20220331092717.9023-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220331092717.9023-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0601CA0074.eurprd06.prod.outlook.com
 (2603:10a6:206::39) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 552c96d8-4929-4907-78f5-08da237a2e28
X-MS-TrafficTypeDiagnostic: VI1PR04MB3968:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB39680D17E18B6A31C6108072B3F49@VI1PR04MB3968.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JHOVFhNb+V6DNkTvP3z4389S0j5KJ3ytqvkgKyL2mgOlyylyZmM9Ko0dwy3IZtG7hVGJZJJRaJsHz2RJ5SO9j8FolClwJIdQCC490qztN26NUYecNWNjlnaYztf/44XiNA0SKFdu30EWPodMzfjDpQ35HbD/J2n78NprvPtYnHk1aIjMHoSNVRk0PdDO7zollPGWjFpkIC7Krq/BXOh1tU4s4oBLk0DpjqJeX77dkQt1QqaluUCcg3NNalLzMpl5naslJy1GzcNzj6q8gtWH8tiVd2tsRmwmWkHsIYJfrWRwOBAMOpdn819mtaRgkjgFTlNuHxc+VPM3leBz9nNaFjiEgIa8+5p/FpzbgCW9dxRAwTCODZJZ42vXIC1PCgqWXCfdJUSdE0UyyzFvXmCcAGd/D5sxZ6LnFs5bcM3wBwhTSmaOLa9xO75owHq0hlws0OCaYaehAP8X6ojf/LneU/Zq0ved6ouUSSCbOOMKUihuZtLxyYIyAjQTA4Z8+vvS5k4/SxqsjbDnuX776B4fk1ET6YngL3pM/Elv0Emtm5QBDFZMuMmOz3lmLRxzdcdd/hj5QvzuByIyzBPHNNnpNfTcWGICD93e0AWipIuY371jFix+USKXw35ErC+/siDSKpbz6Uuh2i5lEvItUkisqvlDEhyEJLJ7Cq0TxE022mxRTyKAfY+03svpauE6pY0cd73Djp+OKCUbbQ5hlkBTOUL6jwShqMEeiOwy6u0AD5EsdSUK1wovjd4W/Vi2L4Pc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(8676002)(66556008)(4326008)(316002)(6506007)(6486002)(83380400001)(66476007)(66946007)(36756003)(86362001)(6916009)(508600001)(8936002)(53546011)(5660300002)(31696002)(38100700002)(2906002)(54906003)(26005)(31686004)(186003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yY7tjiYu0byrtui1oiY5ladOpcha4mdEzMd3hzLATzylJyv2nhcbRw1Pvz2J?=
 =?us-ascii?Q?AL8cwsHipHbCoIX0/J7fYdA/q4ihyJ4NtTCHkvQRU5FvhD+vv/4wbM0WhDda?=
 =?us-ascii?Q?jYZ7z9okkQJqGrF06WjazoBNFEmQ9ffpaIN/peeKwuTqKoyAPsa1gJXr9R2r?=
 =?us-ascii?Q?/gGIIjFkhZIkxbmeqM7Q7Ugh6E5DtoIB78YzBCR0nih6IDswsaMXWGQTykZz?=
 =?us-ascii?Q?ied3Ub57rxdi6BjD5Hr3BpusIViN+U5CyCGZMdxoCBXIqT3ZhozaX8T458GN?=
 =?us-ascii?Q?LuslA0lRE+BfcNt9qh9VswqF1bkx49aLC2+22BdeyYy7uF2lAQLLFcyelZ7L?=
 =?us-ascii?Q?8sTtlou1BK3a6spDTeq42+DI1b4UaCVWxITIYngM9Hq4LgfxFPiFJ9hsHWia?=
 =?us-ascii?Q?iBPABEW+LzzRtN8hWvTEKGc5jrVAjV9gb6ZgcEv9I4x5u0MpXp042h3a+2we?=
 =?us-ascii?Q?UTMoBxQjlgfI1mX8gN6evfsPc12SGpYwpTWd7Q6oNJgIpc8hNCgXRLuwZLDf?=
 =?us-ascii?Q?PZ1b8hX/t65UxvC+e8ejAa+fDwwKddqB3pqIsFmBMt1oAObd8UPiEjk2rRJA?=
 =?us-ascii?Q?puP1qc3AkJBU7wx3jPKvfRCmajhRLMX7xyDT3bezTjECrwXvV/VjpMHdZq55?=
 =?us-ascii?Q?lnk6k0ckFOyfDK6BAIJsdFtSOK/1moCDAe61JiiukKwquLp97w8XrWDL/n4w?=
 =?us-ascii?Q?io3wOeYVPcs41TB1sj2bxZ1MB2iaIHaQduR5Ogo7pnBwHqcKZRKC05+HIW6D?=
 =?us-ascii?Q?9GyehVWcinaxbxoYb47MyAxWI5QimSl8bN/XYYMrrkvKXnlqRdvB8pqiehJK?=
 =?us-ascii?Q?w71WMTwUNUzmEv4hZaZTQDS5Mr9Q738ea5uy60vqUx8S8pHNdqvJdA8bEKQB?=
 =?us-ascii?Q?V3+f9R00bhVmUoGj6LZu0lFzZK+z/I9WB1z+5hvXYOHcylB0BNAfw0AkYB+u?=
 =?us-ascii?Q?7rHIdeTDT5EyL6KX3Gm9Pm5CVzypJv/MkvCoEBKSGyb7fFkJjVWdrmOAhPiD?=
 =?us-ascii?Q?3sT06hOPZP/DVkxTu3UrtkhuuBOf6oZQhXtZGPU2wWqtc8bH/lVfPxEc1hkh?=
 =?us-ascii?Q?tdDg5ByJwOCfQnOwaK4rhkoZY8+vi8waTBhXwdO5dpVdKFJ39WY5cfe9qs49?=
 =?us-ascii?Q?zytvaUs/EgievR4lbF5MM3e9AiTY7JqgD0TDiRj/AEsIekQ4Fac/tmSNKHxx?=
 =?us-ascii?Q?eXwHW3CNjN5+HLupZXArD6bV5NeniwMGuXGP0+Gc4xfaPNSLbVAyw3wXUP+C?=
 =?us-ascii?Q?ASfCsBA7r3qpZTb9nFD+YgGfD3NtEpZyRJCmYIeeNpdNYlhsIcYMnwyoM3op?=
 =?us-ascii?Q?6YP6/sX5PMAoGOHLddcdPG0E9UUbO641P2B3vMpWp7VwOfH1hRtN2jcyCgNT?=
 =?us-ascii?Q?7vGIOrQ8gg6vBwGUHuigc9qmBFa6IEMOR6cO8s/efWmfdM5TBJODWL2a6WWa?=
 =?us-ascii?Q?iwlqKJzB7yTaYoCftOQJcNRFeGSm3iF/wvAl0KPfw3yeH3jMyOY7QILqRQjg?=
 =?us-ascii?Q?gE4Rd4KsmNmgLbWfg517jqYBFmEU+Av6BDwWnHsLljZkxQvRBTUuWCuwgoXY?=
 =?us-ascii?Q?21DL21wpVBJ6lqbbbZ+VQwCqkvD8/cjn+w8xkxpPhu1T0TqIzss5x3wBgDa1?=
 =?us-ascii?Q?vt9UZOF3ozOfpOZv1jwZVlhXp9o9T7gTP7KM+sc0UfyoZ3MYRBJpMOhmqjE+?=
 =?us-ascii?Q?WwkX1f+Pg+/wsUf/dUB+1Tu3XulF2d5l79o0jqe/E7Iq66HIhVoa9Xe5SMHc?=
 =?us-ascii?Q?NPBCaU/q+A=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 552c96d8-4929-4907-78f5-08da237a2e28
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 09:34:49.5295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sgXlN/jkGMvat+BMYfzE62YTiBYCUHrPcSpAdhuTMQ/lHlgz+1j2gc/8O5GzBpmLKXwPW0mlgYO6gm9NMPNk6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3968

On 31.03.2022 11:27, Roger Pau Monne wrote:
> Use the logic to set shadow SPEC_CTRL values in order to implement
> support for VIRT_SPEC_CTRL (signaled by VIRT_SSBD CPUID flag) for HVM
> guests. This includes using the spec_ctrl vCPU MSR variable to store
> the guest set value of VIRT_SPEC_CTRL.SSBD, which will be OR'ed with
> any SPEC_CTRL values being set by the guest.
>=20
> On hardware having SPEC_CTRL VIRT_SPEC_CTRL will not be offered by
> default to guests. VIRT_SPEC_CTRL will only be part of the max CPUID
> policy so it can be enabled for compatibility purposes.
>=20
> Some reasoning regarding why '!s' is used to annotate the feature:
>  * '!': the feature might be exposed to guests even when not present
>    on the host hardware.

As mentioned before I don't think ! is to be used for this particular
purpose. But this needs input from Andrew. Hence ...

>  * 's': the feature won't be exposed by default.
>=20
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

... only tentatively:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


