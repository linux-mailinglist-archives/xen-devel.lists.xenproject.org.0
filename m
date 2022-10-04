Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E78CD5F42D5
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 14:18:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415485.660073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofgry-0004NP-C3; Tue, 04 Oct 2022 12:17:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415485.660073; Tue, 04 Oct 2022 12:17:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofgry-0004Jw-8u; Tue, 04 Oct 2022 12:17:54 +0000
Received: by outflank-mailman (input) for mailman id 415485;
 Tue, 04 Oct 2022 12:17:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AV+7=2F=citrix.com=prvs=269045312=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ofgrw-0004Jq-Ur
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 12:17:53 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8fee6971-43de-11ed-964a-05401a9f4f97;
 Tue, 04 Oct 2022 14:17:51 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Oct 2022 08:17:42 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB6673.namprd03.prod.outlook.com (2603:10b6:a03:398::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Tue, 4 Oct
 2022 12:17:39 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 12:17:39 +0000
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
X-Inumbo-ID: 8fee6971-43de-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664885870;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=C67pux6E9DH50pywKQQFU7AKr8zmVN0Gsf/T3qfFnNU=;
  b=ewtmi+r4gac0RAsrnvx313cfUqOskgohOhaBihuokJoSy11T9RzApdAf
   Rvu+QFfTZ4INPN2FyMlupsvCKb0S5MkdrOuP5DXSyOODWiIGu1JVhCRc5
   iHAcZpUsKwYl81Z6uau42IB+lYLv5EsSYtzWlQac5/nWrJH7dn+Xf1dp2
   g=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 84451045
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:WPJ9uazNd67sh8SPV/J6t+csxyrEfRIJ4+MujC+fZmUNrF6WrkUAn
 2ROC2+CMv/fYzf8KdAnbtngoR4Cu5TdmIc2TlZpqiAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHPykYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFsMpvlDs15K6o4WtA4gRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwx+9cEWNx+
 /MhMw8SaB+T2vOR/rKgVbw57igjBJGD0II3nFhFlGicJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9exuvTi7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLVri7x37eTwEsXXqoQPqeU9fxh2WfN7W44VSYoVxyEhemQ3xvWt9V3b
 hZ8FjAVhao4+VGvT9L9dwalu3PCtRkZM/JPF8Uq5QfLzbDbiy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU331y1uPhTa7OCxQJ2lSYyYBFFIB+4O6/tF1iQ/TRNF+FqLzlsfyBTz73
 zGNqm45mqkXiskIka68+Dgrng6Rm3QAdSZtji2/Y45vxloRiFKND2Bw1WXm0A==
IronPort-HdrOrdr: A9a23:KkhHFKirKWo26l+GNRN/hnNgF3BQX0F13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7EZnichILIFvAa0WKG+VHd8kLFltK1uZ
 0QEJSWTeeAd2SS7vyKnzVQcexQp+VvmZrA7Ym+854ud3ANV0gJ1XYENu/xKDwTeOApP+taKH
 LKjfA32gZINE5nGPiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SuV
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfoWoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A7eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6Nq+TgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQf003MwmP29yUkqp/1WGmLeXLzQO91a9MwI/U/WuondrdCsT9Tpa+CQd9k1whq7VBaM0pd
 gsCZ4Y5I2mfvVmE56VO91xMPdfKla9NS4kY1jiVmjPJeUgB0/njaLRzfEc2NyKEaZ4v6fa3q
 6xG29liQ==
X-IronPort-AV: E=Sophos;i="5.93,157,1654574400"; 
   d="scan'208";a="84451045"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D6/TgnnZ1E1AoizlrJNMnvhPAIfdBqd83wBq8klm5eWJ3woQVTiJdp1Vtif6FVWTJ8Azn/HayJwPYOKCzmhz7kzc5RryTuWvNHv+01NYhLyAdA5J7yP9/++lERwXLvDIaWxUeo5BrCHnyatz7SJ+3hzkJ6OAx/Loqpsx1wEVGCIiYu2Xk2EWzZybjTrSKLCcT08/5euUf7k4+VvpWj/3iDOd4YmUb1DjYKvP5Mux1mHIGhn7ma+twvBuVH7Z2uedtpC0CYOMhajsIFNnIAeNeqp7EjER400pWYQkaNpW/PLYMAhQqJ/u60IMd30B1DpIAfHdP5U/oqIZPTLVMZIS4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MzJtNBInalBbzFlgsONfFl9I1w4GX2Atzw8fcSu4wYc=;
 b=H33dJAj2pAjN/+7iZ8/RJK46H8C/yMNczbK+LXHf9qdvWCT5QqWK18xRDvUsQqOVdBeuuVKYLXE43NPJz50rjVaHZ+/FbeeNQmLwt0oRu3BNCu+/bst6Dl8jgwg7YhM6RtydqEMngE9wEVoF1UL06a4y2NZmUx/M8psltJZ1KIaASYGal8R2t59/xMz/1YhJrvqDxMeqmeOkmuBBZ1Py1goDkVegbtPGMV/I9Us4XPJwp1XY4VNH1ALpjPOycfteMk1BDGKNtVEC0s5RVQK3I8JCEbzSA229owynGdQWWGir6j3SsK09X5yZQBKqL23k8XyxKpZxF5YHOXnPVXkUAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzJtNBInalBbzFlgsONfFl9I1w4GX2Atzw8fcSu4wYc=;
 b=IZtwb8BMF56YdJCHGXa456fmD+Y4/Mmc7yQ1vYUBoFObHymzNQnW5YnegNAHr9oYnyVfa1m3XQAmwjnKMbjp2P9ifmNiMJUTXbbAkPIErrLmFIzIIXX39yEzP3qH1xyOeH8FGIKH5Qmk7iSas91vvE3s9I+8cQ1+xDKmQVukfw4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 4 Oct 2022 14:17:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.17] x86/efi: don't translate EFI memory map MMIO
 regions to e820 RESERVED
Message-ID: <YzwkXh+8xzbCZdkO@MacBook-Air-de-Roger.local>
References: <20220930141737.67574-1-roger.pau@citrix.com>
 <e3235c0f-5964-0f95-fcc0-bcc44bf9d784@suse.com>
 <Yzv8lpnf28aXgQQM@MacBook-Air-de-Roger.local>
 <ea544e76-0dfd-4f24-89ef-25265f7b049a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea544e76-0dfd-4f24-89ef-25265f7b049a@suse.com>
X-ClientProxiedBy: LO6P123CA0050.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::6) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB6673:EE_
X-MS-Office365-Filtering-Correlation-Id: dc249d05-2e09-4604-04e0-08daa6026df0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9mD92CtjDMiwJBR6k9LQcjOVJwr+9hq0uUZxd6y303koAfJzZAGJYmTGyZQXJQZsP+nMnAPtxTyItdf7j1iy3tLxo+eZnqq4uXiowng3zMwqd7FXgubdWEGeWepLs6QXl/1DdepUMl28HYguX6VBdY+5haU2F6COxeeZbrUouFmPQK+LCnE7NRzmPIeovF3YD8YcvRKsl4EndRoJeOjL6bDpPF6uerzyCS/4g8uS+jHHs3OSPltplSGTKfRrmHSiymHZyymx9HJBEhhY3BH0xCLmpGwiCl9PFsMJqg4VqzAb1vXbgDkQ0Em+yuOyPsjISDdMrV+F7Y6ioYbPQLTcwHtwLDYNKuEoW6eHZ4XJYk6fdsCLbveRReG56wgu6B+3ZL9bqm9QKkQvQ/f328LZJAlmVx9Xo8sQmzVWKdTWPCyWL9eLkzkpBN6o4DRdTWCixrddKOytBfEca9xlM3hK5MigFRLdb1xpnqdLSVfx1mG2zdfV/gmhnXBLzur4hAki5YJhDHtXOWHSxCt6s0IQVQd4xzor2kM7zCEUVJcYmqZmwpXXtc9br1WewpPYvhsCZ/lBNmQ5qiimXI68fLQEK4S2NDuhoj745JaAXOe9ngovJi0w/dM+8rfcgPGCAAx3fV2KloIIziBkQ98yplNN7plIPevQDhNPwkZ/oHdZqRBGqiSF+hJqsWxUDBH44iCP2/ZpQM1jzEiQOzoQgpl7hvKqrYmI5WuFLQqBvBIuZf2w4BN5GzxYJOHulzFY79RocBS6Z/OgJgMVqzsgSYweXw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(136003)(396003)(366004)(346002)(451199015)(2906002)(6506007)(53546011)(26005)(5660300002)(6512007)(38100700002)(41300700001)(9686003)(86362001)(478600001)(66556008)(66946007)(82960400001)(66476007)(83380400001)(186003)(85182001)(8936002)(8676002)(6666004)(4326008)(6486002)(6916009)(54906003)(316002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0RlMmNJVGF1VHBMS3duVE9kK2VrNk4vdmlKZlhlaGJDakZ0cEFFbzNnS3lK?=
 =?utf-8?B?c3NnTEVJNTd6MlZCS3ZIVTNMR08raE43eWk5Sy9tSlZGMXEzTDZFZmxGKzJs?=
 =?utf-8?B?Z0ZES3MwazlPYjBma3ZXODZuekxRRmNmTjRUUFdRYUh5WnJZZzkvSm1HNE9U?=
 =?utf-8?B?YzRzSjhMK3YwQ0NKWXlGSHFRUVorUFZrTERsOHdtOXVidWNXQ0dUMFYybi9M?=
 =?utf-8?B?dTVvVUllOGpkWjBObm5wNWZkOVhDOThsZVVseGUrWXRRODUvQ1VxMUt6TkFx?=
 =?utf-8?B?NkRCK0s3c3lnSy9sdzY1RXp5L2cwZGhuRGd0NGNPRlF5alpkRU5oZnNscXps?=
 =?utf-8?B?bStub3lHcWkvcjRIV1VvWHQwcnZ3NXcwNWIyQ2ErR1MrZXNhWmc1WnhLM3pI?=
 =?utf-8?B?V2p6OGFYcVhxSXpVVVpMSFk2V21uUTNiSWJkbmtPempvQVY3SEVNbkx6b0tB?=
 =?utf-8?B?VlZUNWRYZ3FjeGFueGlqRTJhMmdla3ZaR0hJUGhwaDFvK1ljZkNtQmZNOWtj?=
 =?utf-8?B?TWhtbzlLeG1WQTNKUTJyWENiZWprUXZOYTYydjZScFIyalFNUDk3TkNZMXY3?=
 =?utf-8?B?ZDRQQ1h6Y3lvMlVyRmh1bWVMbzRTQ0dUYlJkZ0Q0QXEzSVlUdnpQaFNyNS9I?=
 =?utf-8?B?SXJ3aFQ5ZGtUMzlESG1qTmNreTZzcklWaHg4VVM2dU5OOU1sYzNqdE9ESFNr?=
 =?utf-8?B?TUpud3hpdnlOZGRJY2tDVlFCU3lIZ0J2UzFIL0N2bjJzdEpaekZGaXlLdGVF?=
 =?utf-8?B?YldYbG1sbERpSlVRY2tsOExQOTZQZnUzVFNMWjBsL3NsSVFqOVZJZGl1YzVh?=
 =?utf-8?B?MXRkRHY1ZVozcEpVQ1JaNUVhY2ZiNVYxU2VROGpRdzhWU21PUWR4ZUZKY3U2?=
 =?utf-8?B?aE5mZEtBdEZqaXlTYkNGVm56eS8vVkZBNG1oaEp3ZndBdkYxMmhDcmcwaG1u?=
 =?utf-8?B?MkcvL05DcHhnNXBHUi9xaHY3QUNPN293SjY5WTFRZGx2Wm05RmxmUGR2bHBD?=
 =?utf-8?B?MHBGYlhPOG4zRms0NDV3byttbzVGYXZPbjFMaWtVeDlVcklLL0V1ckhUK2hG?=
 =?utf-8?B?Z1VPdnJ4cDg0MjRCcUpqbFFkVE1BK0YrWFl5bHNoampHSk43QTdCY3VTcnFC?=
 =?utf-8?B?MmVrS2pWWXgxczU1NGtNVVRJcGhtREZrUHJ1TFMwZFlQWU1rc0Zma2o2V29V?=
 =?utf-8?B?aW1lVHZ5cGJWWmY4NUhDN290YSt0M2dpZnphVDFMeEZmekhuZFM2UjdYL0JG?=
 =?utf-8?B?cnZ6dzVOZysrbzZFMEptWG9lUHAxdCsxbTdZNnp0UXhXYndpNEpEUDNBTUhC?=
 =?utf-8?B?MDY0QUlhZElJRktOVjM2eE1xcEhvS0cralpyUWxhOS9rQlArdmtIMU9veW52?=
 =?utf-8?B?U3dhdlZtVzJ5OWVqM0ZJQzYyQW4zUG1wVTFiZ00vK1BxUU5vL2hhUlU0QXU1?=
 =?utf-8?B?dHZVTW5mLzF1cGlOanNrVWVTbkY4UG5mL0pMYVRNRnNLNmhyVjFjWmRpdmlm?=
 =?utf-8?B?RW0rUkRuTjVCR1pkQzlzOTlVRy9vL3g3a2pMZncrelhQVmIzYnpiLzJxcjgy?=
 =?utf-8?B?aFh5dXM0bU1vNHBOMjFIdE9EVUpTNTc1SUxvR3AxYVA3dXRTekFZZUpFTE1X?=
 =?utf-8?B?VEV1QWxDMEsyZWdMK0VtY0JtdUVVWDRoNmRmdytZV1Z2RjRhSXUyRU1DdGx1?=
 =?utf-8?B?bHp4a1ZHM2pkT0ZmOThRcy85TzdXTFBBNWl4YWc5bm1oUlNJMGNHVGJjUlli?=
 =?utf-8?B?SUpiUFg5N1l6enpSUm82V0NYa0hiWTVhQ3RVWFN0eldsZWFIMXlIVnpPd3Aw?=
 =?utf-8?B?Q2hsMm1KSm5LVnkwNmtud0I3YXhvbW5BTkl6Ny8zK0tUT2dVOFZVdUFaK25X?=
 =?utf-8?B?TXZtRDhnL2wvWjUyc0dZb0tPTk10NHF0Tndnbm1NV0dQZjdVYU1FQTlHSTV3?=
 =?utf-8?B?TzBsd0RiM0Y1VmZZWHVESDlTSER4UHE4aU5vVFpnVTlxNzNST0FpdjdzeWs1?=
 =?utf-8?B?WTBaakN0MGM2NklUSzBadWkzZTB2WG5iMmpLc1BwVGRzZmdycGNVSk5rdktq?=
 =?utf-8?B?UGJ0aXJVZ0dqOWNaTlQwdVdRaHU0RGUrbVhnMlJNYWZGWU44b25tV0RKRjRK?=
 =?utf-8?B?eFROKzhsTm1JMldOVlpCRFFSbTFrQndBWUFTbGhWWUtHclRkeUNWNFY3aEZi?=
 =?utf-8?B?Z3c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc249d05-2e09-4604-04e0-08daa6026df0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 12:17:39.4370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W2Cuwamy2ntq3SGv+5ZFgwDmSqVcMnfeDekdI7MFsDeT53VLKs7UYnRb6ruRYx9ufEgPeH7k9SSMv1aBmF4TKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6673

On Tue, Oct 04, 2022 at 12:40:10PM +0200, Jan Beulich wrote:
> On 04.10.2022 11:27, Roger Pau Monné wrote:
> > On Tue, Oct 04, 2022 at 11:01:18AM +0200, Jan Beulich wrote:
> >> On 30.09.2022 16:17, Roger Pau Monne wrote:
> >>> The EFI memory map contains two memory types (EfiMemoryMappedIO and
> >>> EfiMemoryMappedIOPortSpace) used to describe IO memory areas of
> >>> devices used by EFI.
> >>>
> >>> The current parsing of the EFI memory map was translating
> >>> EfiMemoryMappedIO and EfiMemoryMappedIOPortSpace to E820_RESERVED on
> >>> x86.  This is an issue because device MMIO regions (BARs) should not
> >>> be positioned on reserved regions.  Any BARs positioned on non-hole
> >>> areas of the memory map will cause is_memory_hole() to return false,
> >>> which would then cause memory decoding to be disabled for such device.
> >>> This leads to EFI firmware malfunctions when using runtime services.
> >>>
> >>> The system under which this was observed has:
> >>>
> >>> EFI memory map:
> >>> [...]
> >>>  00000fd000000-00000fe7fffff type=11 attr=800000000000100d
> >>> [...]
> >>> 0000:00:1f.5 disabled: BAR [0xfe010, 0xfe010] overlaps with memory map
> >>>
> >>> The device behind this BAR is:
> >>>
> >>> 00:1f.5 Serial bus controller [0c80]: Intel Corporation Lewisburg SPI Controller (rev 09)
> >>> 	Subsystem: Super Micro Computer Inc Device 091c
> >>> 	Flags: fast devsel
> >>> 	Memory at fe010000 (32-bit, non-prefetchable) [size=4K]well
> >>>
> >>> For the record, the symptom observed in that machine was a hard freeze
> >>> when attempting to set an EFI variable (XEN_EFI_set_variable).
> >>>
> >>> Fix by not adding regions with type EfiMemoryMappedIO or
> >>> EfiMemoryMappedIOPortSpace to the e820 memory map, that allows BARs to
> >>> be positioned there.
> >>>
> >>> Fixes: 75cc460a1b ('xen/pci: detect when BARs are not suitably positioned')
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>
> >> In the best case this is moving us from one way of being wrong to another:
> >> So far we wrongly include BARs in E820_RESERVED (_if_ they can be
> >> legitimately covered by a EfiMemoryMappedIO region in the first place,
> >> which I'm not sure is actually permitted - iirc just like E820_RESERVED
> >> may not be used for BARs, this memory type also may not be), whereas with
> >> your change we would no longer report non-BAR MMIO space (chipset specific
> >> ranges for example) as reserved. In fact I think the example you provide
> >> is at least partly due to bogus firmware behavior: The BAR is put in space
> >> normally used for firmware specific memory (MMIO) ranges. I think firmware
> >> should either assign the BAR differently or exclude the range from the
> >> memory map.
> > 
> > Hm, I'm not sure the example is bogus, how would firmware request a BAR
> > to be mapped for run time services to access it otherwise if it's not
> > using EfiMemoryMappedIO?
> > 
> > Not adding the BAR to the memory map in any way would mean the OS is
> > free to not map it for runtime services to access.
> 
> My view is that BARs should not be marked for runtime services use. Doing
> so requires awareness of the driver inside the OS, which I don't think
> one can expect. If firmware needs to make use of a device in a system, it
> ought to properly hide it from the OS. Note how the potential sharing of
> an RTC requires special provisions in the spec, mandating driver awareness.
> 
> Having a BAR expressed in the memory map also contradicts the ability of
> an OS to relocate all BARs of all devices, if necessary.

I've failed to figure out if there's a way in UEFI to report a device
is in use by the firmware.  I've already looked before sending the
patch (see also the post commit notes about for example not passing
through the device to any guest for obvious reason).

I've got no idea if Linux has any checks to avoid trying to move BARs
residing in EfiMemoryMappedIO ranges, we have now observed this
behavior in two systems already.

Maybe we could do a special check for PCI devices and allow them
having BARs in EfiMemoryMappedIO, together with printing a warning
message.

Thanks, Roger.

