Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E3C48EA20
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jan 2022 13:52:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257619.442783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8M2v-0001Ii-6N; Fri, 14 Jan 2022 12:51:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257619.442783; Fri, 14 Jan 2022 12:51:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8M2v-0001Fx-37; Fri, 14 Jan 2022 12:51:09 +0000
Received: by outflank-mailman (input) for mailman id 257619;
 Fri, 14 Jan 2022 12:51:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4vmv=R6=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n8M2t-0001Fr-N4
 for xen-devel@lists.xenproject.org; Fri, 14 Jan 2022 12:51:07 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f6bb26f-7538-11ec-9bbc-9dff3e4ee8c5;
 Fri, 14 Jan 2022 13:51:02 +0100 (CET)
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
X-Inumbo-ID: 9f6bb26f-7538-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642164662;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=M4LjEBFz+kxJpltpmPBIu20nyAjwRwkKtDNKdiqjbSk=;
  b=WprV43ViVLCnKGKRsTQ7lomH4o28FDioUGpz1UVnjMQAPoFOsvVA3L9T
   LRDK/b1jkdbbtjLUOxcPUZ6YoyvkuApBt4yx9EFU4ufi+H7koDBqda5kC
   RJmYb+PE0iUNoPoB0APvzhPpNbT7ZmrTEJHZ1pCpMJcpzZTbGr4A+GVV/
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 5WVHpWQrrcWtCL8ePM1vbvAZY+Qx1UOrDvrhpNvV+KAej0kXzUr/jiJNjKNTe9XxehYmqdKinK
 hNxlEsDc/71GKhcz5CIhMfO8HP+cbZr0Yfj36tMvtHtCY0z5LKHtGHysxTThlX2C2I4Ca75lE1
 DqrUeYTR+pC8Hv3tal18e+V9fLV3nav79+AwW12P7izW4Ifxw3E3UHE0y7yrg2GR0i0/C9PRrP
 dJDMFI03ZZortHovL35hHVDcbZXJwnxm1ThINpMiSjLV3d55i5EZPwF4h/Nb3vUjXzJLU2b6at
 iMpIWEze9GkoHcI6LWorMDVq
X-SBRS: 5.2
X-MesageID: 61924273
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:SrmbQKngD/AhSNCLAINI3rDo5gwVIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdDGCGafrYMGT2e94nPI3noU0O6pXcyoJlGQE4rHpmRSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh29c02YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 P5ji6S9QCEJBZ3FqPsAbztjMCVcI5QTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glp15oSR6mFD
 yYfQRxzcy3BMjBUBmw0S4wkp9WPuFLWWSIN/Tp5ooJoujOOnWSdyoPFMsfTPNqDRsxXn0ORj
 mPA42n9RBodMbS3yjeb83Tqmu7Gmwv6Xp4fEPuz8fsCqEKX7nweDlsRT1TTiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0efBdDuk74wGl0bfP7kCSAW1sc9JaQIV47olsH2Vsj
 wLX2YOybdByjFGLYVmzyI+ZpBWSAhgcHXAfWQ0/bg8n/eC29enfkSnzZtpkFae0iPj8Fjfx3
 y2GoUACulkDsSIY//7lpA6a2lpAsrCMF1dovVuPAgpJ+yskPNbNWmC+1bTMAR+sxq69R0LJg
 nULktP2AAsmXcDUz3zlrAng8diUCxe53N/03Q8H83oJrW3FF5ufkWZ4umEWyKBBaJdsRNMRS
 BWP0T69HbcKVJdQUYd5YpiqF+MhxrX6GNLuW5j8N4QSOMAgJVLfpns0PyZ8OlwBdmB2wcnT3
 r/BIK6R4YsyU/w7nFJauc9AuVPU+szO7TyKHs2qp/hW+bGfeGSUWd843KimNYgEAFe/iFyNq
 b53bpLSoz0GCbGWSnSJreY7cA5bRVBmVcGeg5EGLYarf1s5cFzN/teMm9vNjaQ/wfQM/goJl
 1ngMnJlJK3X3iyYeV7UOyE6ONsCn/9X9BoGAMDlBn7xs1ALaoez9qYPMZwxeLgs7ut4yvBoC
 fICfq297j5nEFwrIhwRMsvwqpJMbhOuiV7cNiapemFnLZVhWxbI6pnveQ62rHsCCS++tM0fp
 by811yEHcpfFlo6VMuGOuiyy16RvGQGnL4gVUX/PdQOKl7n95JnKnKtg6Zvcd0MMxjK2hCTy
 x2SXUUDveDIroJsqIvJiKmIop2HCex7GkYGTWDX4azvbXvR/3a5wJ8GW+GNJGiPWGTx8aSkR
 ONU0/Cjb6FXwAcU69JxSu85w7g/6t3jo65h4j5lRHibPU62Dr5AI2Wd2ZUdvKN62bIE6xC9X
 ViC+4cGNOzRat/lClMYOCEscv+HiaMPgjDX4Pk4fBf66Stw8ObVWEleJUDR2ilULb8zO4I52
 +Yx/sUR7lXn2BYtN9+HiAFS9niNcSNcA/l26MlCDd+5kBcvx3FDfYfYW33/75y4YtlRNlUnf
 22Pj63YirUAnkfPfhLfz5QWMTaxUXjWhC138Q==
IronPort-HdrOrdr: A9a23:WgU/m62A5r36dTrj54MUcgqjBLYkLtp133Aq2lEZdPUzSL3+qy
 nOpoV+6faQsl0ssR4b9exoVJPufZq+z/5ICOsqU4tKNTOO0AHEEGgI1+rf6gylNyri9vNMkY
 dMGpIObeEY1GIK7voSNjPIceod/A==
X-IronPort-AV: E=Sophos;i="5.88,288,1635220800"; 
   d="scan'208";a="61924273"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cz7R1CtMqlzyfLJK4txfDSJ/WrPfu1uhcXFQ96pf4sRYrC2NB+u+L3OnQ5NUDBF562XQADojDSrhBXWH+b+/l1D8qSCwSShyqY9rOkqjv4S0TLX2Mh1LIY6ZaVULgJhdhaIlvqxVrC9TMstdCN2v69OVDoHjI+OVyLqWdKjwfZmKN+Cl3QlLudBzuBaDFnbnJup2e0gOhJFVN2dUxCxwZ25TeQpT3pcNaUClY/LDIqzYCdSLakvg1bsm+qk0Qy5BlpTbVqaojOyLFwDVWIQM20ZDQzUiZ2xL5+L+9EmIK/VC0kZnkR0VVVvJ/c3hogV91WOxZizPPK+c/yd0V1GofA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkMMU6L5+gMML10/DhMI0HVmN3YPPrDXHNZKUjqxSuY=;
 b=dOI+s7SEzL4F9r3QZYR3xOU6x/kBmskB/CEDzgMDTBRKinKRks7g5JmV/FKG6GMH/ZcB1XYjjvsUDq0H4pjLfc8NhWOPJyTx4k58sLfxmZHz7hARWSuasQN7as9npjBLoQUME0eUrq/nkB3gADtRUxdaUAu0q9qyQamFbpmOTK+UoJwpVdZCEoGPrD3mD4Lk5IFJGbNDEhCEIYeePhdku62GLRMLQMPuv7RqFuB1VtyLo5IogXZDhgbPThQ/61vR/MDRcKGCOClnXl3Tz5sipBHre5KymarlMiXUTg/6y5BlWCr72gvc8eZAsYNmeI7Ts7BvXzwHaYHClNv+QBRDow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkMMU6L5+gMML10/DhMI0HVmN3YPPrDXHNZKUjqxSuY=;
 b=o0CfegWtAn3CIzxVblFI4TEN3Jn05zigF8x4EyyE9DHt+qE8AeOgFpB3Uo7XBacq1CCq/KsSHyCo2VHAxsau7uXSu4MgmVAkl40Ge8iS+vqegqzHyG4LYjJZQFUcd3V/PGaMVYvfc6UWNoxnoovqqBB5gl9vTJv5CUyb/BsUu6M=
Date: Fri, 14 Jan 2022 13:50:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH 3/3] x86/spec-ctrl: Fix NMI race condition with VT-x
 MSR_SPEC_CTRL handling
Message-ID: <YeFxqOPqi/DPpugL@Air-de-Roger>
References: <20220113163833.3831-1-andrew.cooper3@citrix.com>
 <20220113163833.3831-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220113163833.3831-4-andrew.cooper3@citrix.com>
X-ClientProxiedBy: FR3P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a669ed6-f9b7-4824-2fcb-08d9d75c7fcf
X-MS-TrafficTypeDiagnostic: DM5PR03MB2859:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR03MB28594A50482FE9C727EC84938F549@DM5PR03MB2859.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RIiC0xMe8poKHvUw2MBrBaNoU4TZ3v8rr8EyvZPRFiA7+IW5VJS5AIL+QP2TjAnhqmSpnuxmpGEJs/UTfv4m/98kGUbgeR58v8/7NEWcWox+8U/aadga0QdVm9j1EYwyyQV0c8fGe+sFcf/UXVKvIRo8SsL/RIaCPg4GDxo3FzupNwUqqFzFnOIiOcm1462pGZ3cEoNexEKtuXCC3roLc9KrcBWK9yO+9Fq6f8oUOjB187PBYmGNEWMqFG5D+xrbZ0JLn1F0kFPwuh7IqrwyM4EF5BCBj6grItXhFujuRWnM4Oxr0Ne/h+1FFSA56QGTueEEz4B3q0kYs/R2ba8s6RuM0Bwue0PJAYqCC/DmFLSp9aynR+6pdYqMS6T0IovhUQFbOLUEWGHnIVC7hvRIpAW8PgyKWVI4vL86gaqrKs316M9S8Gnhho4wipHdgmiFTZc/XlkDNdUlFomqRjzUU99w+FPHxInGdi1dUjq/L/MSba0efzc3nsQxoxYIWyPN6qhgSzJVXsAlImC5/0XdRb5Q02vLe/DWufR6OiU4NHI8FgxuX+dEZdLAU7Z90BjFvNHzPQquicbwrRfWgDDpojuOmlMKk6QJSxoFEFb5nG81f5HaOOaBJTbm6rRY/U2d/3zcKst6X3UvK26QVVBLww==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(8936002)(9686003)(6512007)(6862004)(6486002)(82960400001)(8676002)(86362001)(5660300002)(4326008)(2906002)(33716001)(66556008)(85182001)(6506007)(186003)(66946007)(6636002)(66476007)(38100700002)(54906003)(508600001)(316002)(83380400001)(6666004)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OW8wT1E2eWcvOTBsSWUwb2RLS0R2aUZ3YnNoMGtCMFU2WGtMK0g4U2FPSmU1?=
 =?utf-8?B?VWU2Y3pqbWp4bElUZzNHUk95NlhrZzFmdFdPMzh0VVQvOFhDRktwcU9pMXRQ?=
 =?utf-8?B?Sy8weUhDSUlGa1Y1eTdrUUt5V0Uya0czVDhheEZHWTNVN2lSQUhzRHA3QTFn?=
 =?utf-8?B?SEN2TGFTb0tBcDNFNVk5U3hpYmZ3SXRiL213NFFvNU9nRUQ5djBXNElLdmZG?=
 =?utf-8?B?cnprdEdtMTgxRkFlbUdTTVFiQm9oT2xBL05SZG4vTVNmakhWQWZsa3JPb0Fu?=
 =?utf-8?B?c1Z0NDVudCtHV1BYTGttZ2FZR2FpbVUxem5IRFVzQVZPVGxPNVRLbW5zSzJa?=
 =?utf-8?B?K0pOZ3VtenFmVWx3RWpRZS9EUDBIU3ZSemhybVRxN2dmSE9yQnlGZ2xEaDF6?=
 =?utf-8?B?MjdiU2FYbTdsajBBWWRqdXMzekVkOFhycHREbnN3MEhmVGVDQ2dISnc4ZmE4?=
 =?utf-8?B?QzdzbndsdVJpS01kUUxHQ0hSSE5TeEpSZFVZc2M4Rm5mcitaMTJhWmxnQTAv?=
 =?utf-8?B?alQxSHl6d3NCNWJwQTh2aU4vaVF5QW11NGF1RTdrNU1aSDBOSlZGdzZIS1k1?=
 =?utf-8?B?UjRISHkxbVJMZi9Manp1L3hweVZhMjBoNy9PeEFDeEJPM2tUc1pKTVdReEJ5?=
 =?utf-8?B?SVJGTzU0ZWVwdmtqVHRFNmN2RXBENVBUOG9vazd4aWhMYzVBWkhZL1JnNzBF?=
 =?utf-8?B?U0ZNK0gyRjh4Y0xVRWROUW1MUm0xVVRObXZiVDJlWnRTNjJ2bFZrZU5TZjY0?=
 =?utf-8?B?bWMrVjdlYnRNenpXR2sybXRYRkRmUjlwQ0REa3NSR2RLQ2MraGtOcFFkaHpG?=
 =?utf-8?B?VDlxd2pDc3lJckZGY2JFcTZyQk5yTThRbHhzYjNZMVNWZy91M2NnSUUrNmcy?=
 =?utf-8?B?N1F0WkZhcDdrWk93d2VUUVdwVlhPM1BSZXk2UEo1WmxCSFJjV3ZMek9LVU9E?=
 =?utf-8?B?MW9PZUJPRUt1eVkySy9OaWgxSlViVVp6ODBLcFJpeGJMN2FoWVJPcjI0cDU5?=
 =?utf-8?B?bDIzdDVQZzlDcEFCQXpQcXRGVUk4UVI2bmdIRkJIYWVDVUEzbENMM0prOWpi?=
 =?utf-8?B?bnhkQzVveU8xMnRVVVNoQUFTZzVINzRtMEV2SG1PNFpBUUFhMWNVWW5WeGQ4?=
 =?utf-8?B?TE5lb1ovRG5RQS9oNE8vaFNFcVFvUUJpRWtyeFVReWVUSlI2TVNDVExiK1pM?=
 =?utf-8?B?OWRFbnBqRVVidmFld1E0TUlQTG45cFQyVVplOWpQZzVQUWp4VVZCRXcwREsw?=
 =?utf-8?B?RWtwUjhOL1ByRUxTODJCMWt1MERwQ0ZTRDM4b3RxRk1hTzBid3QvK2tHQjRY?=
 =?utf-8?B?M25GendSQnpLdDQwL1Z5VXVIN2NJK2ZYZFVNeUxQTDF5UDlraVk0TjBySmc2?=
 =?utf-8?B?cnRRQ3NKMElSb1R5eUdGOCsvdEZaYmR0MzBNNk51ZndDbXkrMDZQVFhTV28r?=
 =?utf-8?B?WEdnc0I2UVo5blczRmowSTlFRlZXbnFEQndPUTI1Yk1iUkpiZm10RDZHVCtH?=
 =?utf-8?B?WkhYd0NqQlFEZ01SZW5XWXZUaDhwaGZ1dVhCVENnb0lQNnIvMzFURENBN1hE?=
 =?utf-8?B?VklYWnRSNk4rM2hZVWwyVVljYW1TS09lMDZqdmlVWEZ4T1QvNWR2Ly9wTHJX?=
 =?utf-8?B?eEYyYjZWTStUZmpJSFNhMExYc0g2UUtYSTFqcUI5eWo2QWVVd21VRVBuMWhB?=
 =?utf-8?B?WlhEYm5yc0srdFNNRGFpejFOYnE5YUdIMXFhSzZ6KzNKN0wranNpWldXZVNV?=
 =?utf-8?B?T2V6Y0dqZjNkSE1iVnRpbGErYldGS1VMZ2ZiMWI3UnZJSVFwMGxKdVJ5VWZn?=
 =?utf-8?B?R1NpRE43YXQySWxLcVJxZTRSSUFWTHdOZnZrNkZoelVvRGljQ1ZGUjFJL0FP?=
 =?utf-8?B?U0J0eDgxbVRUWHZ6SklkV3FyaDJKRmdQN0I1Y2FGZXBVWHhQRDNRZmtVTzlG?=
 =?utf-8?B?cllWT0FuWThvR3laV0gzcjdLbFJGNXpUdC9vY3JrblZLN0c2MXJmWmdIT1Bm?=
 =?utf-8?B?NEZ5WlF6MmRzdVdxN2xYbkE4ejBYWHdwQjIrTzBZNFZDYmNOcXRGUnJ5Z1d2?=
 =?utf-8?B?SlVuT0xGSUROdkl4clhqbURmV2Q4ZjdFc0lMK2lrSXNxSk9idUZMazRQN0Zs?=
 =?utf-8?B?OEpBUEE0a1NqVWZ4RWRXWEdEYTlaMGZTcEMzZzdSR1V2dDdHSXp1M3VvakNm?=
 =?utf-8?Q?v1lQVUTNXP1yyd1UVaL+qkM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a669ed6-f9b7-4824-2fcb-08d9d75c7fcf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 12:50:53.2133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4iKCy653tB1KaN+EK5U+/2PvGxIh1yu60eseeR0qdz8Ftqu0E1h0bpe8mf3Fyd7dlt+7Xg7U3wfLlK67d/iOIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2859
X-OriginatorOrg: citrix.com

On Thu, Jan 13, 2022 at 04:38:33PM +0000, Andrew Cooper wrote:
> The logic was based on a mistaken understanding of how NMI blocking on vmexit
> works.  NMIs are only blocked for EXIT_REASON_NMI, and not for general exits.
> Therefore, an NMI can in general hit early in the vmx_asm_vmexit_handler path,
> and the guest's value will be clobbered before it is saved.
> 
> Switch to using MSR load/save lists.  This causes the guest value to be saved
> atomically with respect to NMIs/MCEs/etc.
> 
> First, update vmx_cpuid_policy_changed() to configure the load/save lists at
> the same time as configuring the intercepts.  This function is always used in
> remote context, so extend the vmx_vmcs_{enter,exit}() block to cover the whole
> function, rather than having multiple remote acquisitions of the same VMCS.
> 
> vmx_add_guest_msr() can fail, but only in ways which are entirely fatal to the
> guest, so handle failures using domain_crash().  vmx_del_msr() can fail with
> -ESRCH but we don't matter, and this path will be taken during domain create
> on a system lacking IBRSB.
> 
> Second, update vmx_msr_{read,write}_intercept() to use the load/save lists
> rather than vcpu_msrs, and update the comment to describe the new state
> location.
> 
> Finally, adjust the entry/exit asm.  Drop DO_SPEC_CTRL_ENTRY_FROM_HVM
> entirely, and use a shorter code sequence to simply reload Xen's setting from
> the top-of-stack block.
> 
> Because the guest values are loaded/saved atomically, we do not need to use
> the shadowing logic to cope with late NMIs/etc, so we can omit
> DO_SPEC_CTRL_EXIT_TO_GUEST entirely and VMRESUME/VMLAUNCH with Xen's value in
> context.  Furthermore, we can drop the SPEC_CTRL_ENTRY_FROM_PV too, as there's
> no need to switch back to Xen's context on an early failure.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Jun Nakajima <jun.nakajima@intel.com>
> CC: Kevin Tian <kevin.tian@intel.com>
> 
> Needs backporting as far as people can tolerate.
> 
> If the entry/exit logic were in C, I'd ASSERT() that shadow tracking is off,
> but this is awkard to arrange in asm.
> ---
>  xen/arch/x86/hvm/vmx/entry.S             | 19 ++++++++++-------
>  xen/arch/x86/hvm/vmx/vmx.c               | 36 +++++++++++++++++++++++++++-----
>  xen/arch/x86/include/asm/msr.h           | 10 ++++++++-
>  xen/arch/x86/include/asm/spec_ctrl_asm.h | 32 ++++------------------------
>  4 files changed, 56 insertions(+), 41 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/vmx/entry.S b/xen/arch/x86/hvm/vmx/entry.S
> index 30139ae58e9d..297ed8685126 100644
> --- a/xen/arch/x86/hvm/vmx/entry.S
> +++ b/xen/arch/x86/hvm/vmx/entry.S
> @@ -35,7 +35,14 @@ ENTRY(vmx_asm_vmexit_handler)
>  
>          /* SPEC_CTRL_ENTRY_FROM_VMX    Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
>          ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_HVM
> -        ALTERNATIVE "", DO_SPEC_CTRL_ENTRY_FROM_HVM, X86_FEATURE_SC_MSR_HVM
> +
> +        .macro restore_spec_ctrl
> +            mov    $MSR_SPEC_CTRL, %ecx
> +            movzbl CPUINFO_xen_spec_ctrl(%rsp), %eax
> +            xor    %edx, %edx
> +            wrmsr
> +        .endm
> +        ALTERNATIVE "", restore_spec_ctrl, X86_FEATURE_SC_MSR_HVM

I assume loading the host value into SPEC_CTRL strictly needs to
happen after the RSB overwrite, or else you could use a VM exit host
load MSR entry to handle MSR_SPEC_CTRL.

Also I don't understand why SPEC_CTRL shadowing is not cleared before
loading Xen's value now.

>          /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
>  
>          /* Hardware clears MSR_DEBUGCTL on VMExit.  Reinstate it if debugging Xen. */
> @@ -83,7 +90,6 @@ UNLIKELY_END(realmode)
>  
>          /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
>          /* SPEC_CTRL_EXIT_TO_VMX   Req: a=spec_ctrl %rsp=regs/cpuinfo, Clob: cd */
> -        ALTERNATIVE "", DO_SPEC_CTRL_EXIT_TO_GUEST, X86_FEATURE_SC_MSR_HVM
>          ALTERNATIVE "", __stringify(verw CPUINFO_verw_sel(%rsp)), X86_FEATURE_SC_VERW_HVM
>  
>          mov  VCPU_hvm_guest_cr2(%rbx),%rax
> @@ -119,12 +125,11 @@ UNLIKELY_END(realmode)
>          SAVE_ALL
>  
>          /*
> -         * PV variant needed here as no guest code has executed (so
> -         * MSR_SPEC_CTRL can't have changed value), and NMIs/MCEs are liable
> -         * to hit (in which case the HVM variant might corrupt things).
> +         * SPEC_CTRL_ENTRY notes
> +         *
> +         * If we end up here, no guest code has executed.  We still have Xen's
> +         * choice of MSR_SPEC_CTRL in context, and the RSB is safe.
>           */
> -        SPEC_CTRL_ENTRY_FROM_PV /* Req: %rsp=regs/cpuinfo Clob: acd */
> -        /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
>  
>          call vmx_vmentry_failure
>          jmp  .Lvmx_process_softirqs
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 28ee6393f11e..d7feb5f9c455 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -592,6 +592,7 @@ void vmx_update_exception_bitmap(struct vcpu *v)
>  static void vmx_cpuid_policy_changed(struct vcpu *v)
>  {
>      const struct cpuid_policy *cp = v->domain->arch.cpuid;
> +    int rc = 0;
>  
>      if ( opt_hvm_fep ||
>           (v->domain->arch.cpuid->x86_vendor != boot_cpu_data.x86_vendor) )
> @@ -601,17 +602,27 @@ static void vmx_cpuid_policy_changed(struct vcpu *v)
>  
>      vmx_vmcs_enter(v);
>      vmx_update_exception_bitmap(v);
> -    vmx_vmcs_exit(v);
>  
>      /*
>       * We can safely pass MSR_SPEC_CTRL through to the guest, even if STIBP
>       * isn't enumerated in hardware, as SPEC_CTRL_STIBP is ignored.
>       */
>      if ( cp->feat.ibrsb )
> +    {
>          vmx_clear_msr_intercept(v, MSR_SPEC_CTRL, VMX_MSR_RW);
> +
> +        rc = vmx_add_guest_msr(v, MSR_SPEC_CTRL, 0);
> +        if ( rc )
> +            goto err;
> +    }
>      else
> +    {
>          vmx_set_msr_intercept(v, MSR_SPEC_CTRL, VMX_MSR_RW);
>  
> +        /* Can only fail with -ESRCH, and we don't care. */
> +        vmx_del_msr(v, MSR_SPEC_CTRL, VMX_MSR_GUEST);
> +    }
> +
>      /* MSR_PRED_CMD is safe to pass through if the guest knows about it. */
>      if ( cp->feat.ibrsb || cp->extd.ibpb )
>          vmx_clear_msr_intercept(v, MSR_PRED_CMD,  VMX_MSR_RW);
> @@ -623,6 +634,15 @@ static void vmx_cpuid_policy_changed(struct vcpu *v)
>          vmx_clear_msr_intercept(v, MSR_FLUSH_CMD, VMX_MSR_RW);
>      else
>          vmx_set_msr_intercept(v, MSR_FLUSH_CMD, VMX_MSR_RW);
> +
> + err:

Nit: I would name this out, since it's used by both the error and the
normal exit paths, but that's just my taste.

> +    vmx_vmcs_exit(v);
> +
> +    if ( rc )
> +    {
> +        printk(XENLOG_G_ERR "MSR load/save list error: %d", rc);
> +        domain_crash(v->domain);
> +    }
>  }
>  
>  int vmx_guest_x86_mode(struct vcpu *v)
> @@ -3128,7 +3148,6 @@ static int is_last_branch_msr(u32 ecx)
>  static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
>  {
>      struct vcpu *curr = current;
> -    const struct vcpu_msrs *msrs = curr->arch.msrs;
>      uint64_t tmp;
>  
>      HVM_DBG_LOG(DBG_LEVEL_MSR, "ecx=%#x", msr);
> @@ -3136,7 +3155,11 @@ static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
>      switch ( msr )
>      {
>      case MSR_SPEC_CTRL: /* guest_rdmsr() has already performed #GP checks. */
> -        *msr_content = msrs->spec_ctrl.raw;
> +        if ( vmx_read_guest_msr(curr, msr, msr_content) )
> +        {
> +            ASSERT_UNREACHABLE();
> +            goto gp_fault;
> +        }

AFAICT this is required just for Xen internal callers, as a guest
attempt to access MSR_SPEC_CTRL will never be trapped, or if trapped it
would be because !cp->feat.ibrsb and thus won't get here anyway.

Thanks, Roger.

