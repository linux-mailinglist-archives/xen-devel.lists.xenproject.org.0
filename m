Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 408BA6E6921
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 18:15:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523004.812726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ponz3-00059b-9b; Tue, 18 Apr 2023 16:15:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523004.812726; Tue, 18 Apr 2023 16:15:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ponz3-00056S-6P; Tue, 18 Apr 2023 16:15:09 +0000
Received: by outflank-mailman (input) for mailman id 523004;
 Tue, 18 Apr 2023 16:15:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bqrX=AJ=citrix.com=prvs=465e465d1=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1ponz1-00056M-10
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 16:15:07 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c5ba041-de04-11ed-8611-37d641c3527e;
 Tue, 18 Apr 2023 18:15:04 +0200 (CEST)
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2023 12:15:00 -0400
Received: from DM6PR03MB5372.namprd03.prod.outlook.com (2603:10b6:5:24f::15)
 by CH0PR03MB6130.namprd03.prod.outlook.com (2603:10b6:610:b9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 16:14:57 +0000
Received: from DM6PR03MB5372.namprd03.prod.outlook.com
 ([fe80::f4f8:2c53:17cd:f3cb]) by DM6PR03MB5372.namprd03.prod.outlook.com
 ([fe80::f4f8:2c53:17cd:f3cb%4]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 16:14:57 +0000
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
X-Inumbo-ID: 2c5ba041-de04-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681834504;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OTnlHU1fFwShJQqPzdH7gtEcjZ3s249B0e2b45mwTNg=;
  b=S7wr1pis4WVnKbOgkbBryN4GTT6x6du1z4GVnsoUsji9l0nXmuDO7wLw
   coVT+y2PDzJbDEupTF+EUbqFRwg705QHr2Dar1WoPEfPZP6J8NOUP/f08
   reGzxQEYAje1Lv7tFTJvBL5ZwQe05N+hhocm+e8xJ3kW6cXzKHGLVXCC5
   Y=;
X-IronPort-RemoteIP: 104.47.59.174
X-IronPort-MID: 104761964
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:MkmB6a8cy1VQ7AsfzzPODrUDG3+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 WIdCGmGbqrfM2Hyfoh+b4W1oEkG7ZLdnIJrHlBsqyA8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI+1BjOkGlA5AdmOakb5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklH5
 O0eEW4dPymqxOK5h+74cPVwlOgseZyD0IM34hmMzBn/JNN/G9XvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWCilUujNABM/KMEjCObd9ShV3eo
 mvJ8n7mCxUeHNee1SCE4jSngeqncSbTAdpOS+Php6A26LGV7jA1J0MRCQGZmPqWhl60etBEc
 W0QuSV7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq19bCStzq+fzcUKWwqYjUNRg8IpdLkpekblQnTR9xuFKq0iNzdGjzqx
 T2O6i8kiN07j9MP1qi91UDKhXSrvJehZjAy4gLbT2e09DRTbYSuZ5GrwVXD5PMGJ4GcJnGLs
 WIYgcGY4KYLBIuUiS2WaOwXGfei4PPtGCLYqU5iGd8m7TvFxpK4VYVZ4TU7KEI3NM8BIGXte
 BWK5l8X44JPNny3a6Mxe5i2F8kh0annE5LiS+zQad1NJJN2cWdr4R1TWKJZ5Ei1+GBErE31E
 c3znRqEZZrCNZla8Q==
IronPort-HdrOrdr: A9a23:xOhLIqMvAv2wYMBcTuqjsMiBIKoaSvp037BL7TEVdfUxSKb0qy
 nAppgmPHPP5wr5IUtQ4OxoW5PwI080l6QU3WB5B97LYOCBggWVxepZnOjfKlPbehEWwdQtsZ
 uII5IUNDQpNykAsS8h2njfLz/8+qjhzEl1v5an856yd3ARV51d
X-Talos-CUID: 9a23:SarOP2yIVdxBVjP6Gck3BgUdC9EjSyPNnU75YE+3TjoqcqGJW3OfrfY=
X-Talos-MUID: 9a23:AUDEvgVk+RkdCNDq/GPKq29laJ1K2qeBBFAHsJcd4eiAdiMlbg==
X-IronPort-AV: E=Sophos;i="5.99,207,1677560400"; 
   d="scan'208";a="104761964"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YzoDgSrEJcutBWnAqA7g3qMpzD9m+hS00FrlEu7uffGcoQOM1faComVlO12gFz5CCfT60gIWhha79i3ywrWN/izy/EA6446otRAg5ppW3c2P1iAN1ZYVcXFN7V4oa5fqkYjWQN4KPs1a5cAHcriedPqmOpJm+SwvX46Nw+mA3U368nsbeFpwUgIzMAmBWvHjP6k/gz1Cl1L4665ILVJuR2bwQnxpIZsVqU4Jy3cQVvkNYP3DEF69d35MNyrKP001R9fmvZ1MPZCN6Jy+PX1j2fsn0wQvCCXnPLLr76m6M1AJBSk9r0D9ad5j1qb9emb39Z7jx9qmche9beVbPxUSrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTnlHU1fFwShJQqPzdH7gtEcjZ3s249B0e2b45mwTNg=;
 b=O5TMVSiEb9XhMg0Ar3W3mDl6hnCGnRvb+QMQtoChZzAsaiXpsZUA8xj3VMMXcf97DLGfy7mFj9kYk8BP8ckaJi8A3pBFOUDtKNZKLJdmVghid9uEdm+TUzJTMFY1rnqCZMad0h76VH3XWA7qdmj970F5UnS3PnoddEwg9Ohe307GLXXKXehclEMymxx/rvTr0DpjCxZ0hgaRz8WhkxdG7x0s7aUSGKUVxuMBE86oM14mCbn94juEL1sJiPIwwrud8X7WtpPw/kDQzqPgiml1b1CXmBYPCXRoj2uZ0H0Bno9mDJHtDczbQWXd2csP70hewEHbOewRUnvQ64NJuyR/5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTnlHU1fFwShJQqPzdH7gtEcjZ3s249B0e2b45mwTNg=;
 b=GehfqOngaC8rJNK0HqsL8J7m7XNv2zSv1fM8Xiu0/F2vXdVkIx9PxnUAoUmChincEZoSrK9BpumYlWTT/rAqhMHdZ06GIfXPbY/ZwFPVUY0zj8pDpIHqeschTRN4gTLgAlGSrYA1fanf2gbGiOe8RIsLd9Qw/2QZ3QPa3RAvA1I=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/3] xen/ELF: Fix ELF32 PRI formatters
Thread-Topic: [PATCH v2 1/3] xen/ELF: Fix ELF32 PRI formatters
Thread-Index: AQHZcSYeWIT0W+bO3UKuBt801j9Sd68vbuAAgAAVJYCAAbqv2A==
Date: Tue, 18 Apr 2023 16:14:57 +0000
Message-ID:
 <DM6PR03MB5372A4026B618404FF65EC39F09D9@DM6PR03MB5372.namprd03.prod.outlook.com>
References: <20230417121357.3738919-1-andrew.cooper3@citrix.com>
 <20230417121357.3738919-2-andrew.cooper3@citrix.com>
 <0a94cc73-f99b-a616-d342-8d84e8a274b4@suse.com>
 <639a5440-8408-d6c8-4d6f-68e5f7857d2c@citrix.com>
In-Reply-To: <639a5440-8408-d6c8-4d6f-68e5f7857d2c@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB5372:EE_|CH0PR03MB6130:EE_
x-ms-office365-filtering-correlation-id: 31f0845a-7515-456f-4399-08db40280de4
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 PlrNQcNlhGW4FvFJkCt1N4OU2WLA13W8EcIILP5N0dUn7BSGRNbNVLUFZLCOoYdPBQGv2eKRgSg/KXGwWckiHxrGYRL8cHSOYtAorXNu4WAwY7UwdIdmSqHZKJuxfseJo3Lok6OA998we5bF7G881wovFCmtR6ia9H4Yd+M3F2Eo05TI9p07km+XzgeFE2Wm61GosMf9iLp9gAkN0gvlvBKcHE8EwQRbJNk0tBxlJc+q0wBA9IFeCAE7QVM03rrX0DvmFFOY2JRAnNdFi18yWhnIiV5hck3WhKAfBnt3Vvk88VKoOXAsANJ9n/LmiH5VlTxYLejWYT3fOjEA0jaLrL7oHDpfNchADDU7m/HDiUyY3+Ird//JyS9yKZY9qheySMWHJsXVja8oWp6LXLrPF6zmw1vJIlcQ6ELXLLGHE19WD4n+f/mNdcuJXWgYn8acZiXDjIpB1iK+9Rw1THNJ7GgBI7jRuCE6nhElbqznljk8xN3cl0W3AYR7pFonOU6mm9aZNgsm9ZA/7A1TT6LQlkmwuLBw3Puq5IhS5TXfVJQOhnwuEWH2v1I3ajpRMTxp+fC5h5FVmw0geYXbqvzPPxEuI59lb6lxbxFBhwZBkeNYMgaIWPak4kTsOUC6j10E
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5372.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199021)(7416002)(52536014)(5660300002)(44832011)(9686003)(122000001)(86362001)(186003)(53546011)(26005)(6506007)(82960400001)(38100700002)(38070700005)(8936002)(8676002)(110136005)(54906003)(478600001)(33656002)(71200400001)(7696005)(55016003)(41300700001)(316002)(91956017)(76116006)(64756008)(66476007)(4326008)(66556008)(66946007)(66446008)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/O9TajWfFTDhKzH50vdDhDhORBqY3tjZLiPCCx2H1QBTfpyLvUSVdmYHeR?=
 =?iso-8859-1?Q?mT/G+Wg+I1X9HgY3uVqOt9F9xV3Wd0exdoz7uvHV5WAclJ/lvl+yzEym5d?=
 =?iso-8859-1?Q?XI78ll3O/dwsQLvitvKZOyVln2TznJmW8OMlXnqn3bq3mt1ct8ztxoevH8?=
 =?iso-8859-1?Q?CqYh9UMdeBEW9r/I+tQvYd2yZCZDKjyLhhlgGcGYINpuyU3NO20oYr/HUN?=
 =?iso-8859-1?Q?T4B3swZjFF+b6sEkeIHAqQNaYmbg5DYGt99+6oJfA5I5V2r17FhTndqnxp?=
 =?iso-8859-1?Q?FDPeO8wCf/+jPYn7GJgTLwZPR1VP2ue3BEIVdeqizM+Y/0cpOAfXgC3oqC?=
 =?iso-8859-1?Q?UE305dGL3qBPphZF7vt2bPmjviKvACHQniTXxYnLHtWcR8GsTJGt1HDUH1?=
 =?iso-8859-1?Q?Bd9yt/jODMzuTioQ9CQs3mLaEjZGa0GatlQrVqKpiC4BuiPcy5gc0Z9ux5?=
 =?iso-8859-1?Q?zhwWdh9fNQOoNzt7L410xnigx0pxtyyNmcKIy2SmpwBDodteMcGJf5TMJ0?=
 =?iso-8859-1?Q?5rTSca4zDm2u3isiJgX3kIZMpAvnw3EkC5Jsewm3zdaQxt/E8MfwNAR6qp?=
 =?iso-8859-1?Q?DjH9FhY9MeRiHRZak2ab9iBGPZNP6MtoHMkRBYl4xAw6BEIP4WCkuW9rZe?=
 =?iso-8859-1?Q?AoCenlpav8vvWyLCF6+G7JBtTLHeoi7WLJhon5O0AGnsi5+/Y+0gcl36tx?=
 =?iso-8859-1?Q?jAyKapbPEMZOVQSa0is75/7aX9VVTnYBtO6QUlzQz9DsuqPgBHhVaCB5xQ?=
 =?iso-8859-1?Q?xfvahnBLfLUsA1HM94pOjX4NbOTeJGB/bLYnoe5KvPE8nV1rNaTz/Q7lxA?=
 =?iso-8859-1?Q?unf05Q83MleVQgt/FVLCfNyt4M5+gHfrp1cXQMyVNVC9qSR3vJneDEqAvW?=
 =?iso-8859-1?Q?lorvL68Hzm+uKqJ0ws7A0j7/9t69XzoNDchS+ZjsSYWga7BzEhkQsxxlHj?=
 =?iso-8859-1?Q?pTlRDxolrRTmQ3bJJO3RYaI4UAmI5WhjmKjinj5uShsWQlfJwGTlnB96EI?=
 =?iso-8859-1?Q?ary8V1P5Vc2Pz/zNH8W0GGLyOL3W/ChiWPm/gR/kBjid/nzGckQmXsvOWo?=
 =?iso-8859-1?Q?BWVaEcx9L3tMjgRq5kbAYP+Xcga5x/f8sjjqMQiuBqddGXZSBLfgqpdYYW?=
 =?iso-8859-1?Q?as6cfXxzg+RlznpSS6DnGGn95A+5gh8CfjKfBxHtw0jDV7hsDNG2WJU4gY?=
 =?iso-8859-1?Q?DWCaqamV5dwNcuiiGLhx8ptHQ/UjD0lPNGpg2sotphL8K5PIZ54vQqrhZ1?=
 =?iso-8859-1?Q?QRyWbSwMeQNeSI/V/51lDdt4olE09inU/BvtnrO3d0/pFLwZfSlLmp8iPI?=
 =?iso-8859-1?Q?ti+LHSkc5uWV6TIXJemtcWUOmNSf6dKIp74BsZev89+VR75CoYn6ALElO7?=
 =?iso-8859-1?Q?ZW8Hy9IbA3f5RETWZEeaak6qw1xIdWcRAUYApD6QJuykd6wAtKbP9Qpj14?=
 =?iso-8859-1?Q?Vz0MrgKqLQBW72OiSRWOMeztFfE8paSO9CyYzwy7VHyXGYFBexm2exTT/+?=
 =?iso-8859-1?Q?rencMPP3p4xpV2Z0S4fPBsg5A6SfSBYQGORUv4LxaXSwNMhMDKG27uS9p3?=
 =?iso-8859-1?Q?y5IIoTzQuTGD8GcVQ7AKWqg4r9EdXnOLwd5bZSw95NkGaQWycHulbtZvMR?=
 =?iso-8859-1?Q?HxTa8j4/wk0LklCwyVSuEfjGPn21hZUnAR?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	U1JCYn2OlX2m0Dex7MAWBOCA8jUT2eJpnZaIMGDxYhWW++YAoEtp/W4DDCWdqW7Xw7roUSQSlyLscfK3UwPM9PGgFHBmYZl/UyoXAkSPJyMrJJ0bjvz1V3e/4KT09hYwfn7MDCyF8PkjkSD7zr8zIiNE+MKsTe/OvIoaJnMQGUvX2fMBCy3ACDx1qcB7WwIBNML5A/Do20Ae9ifR3NYcNtAPWwdOJzBO6vuyFIaV2xn23wjG/V4eR4LsahUQaaS5SVVrsKx6UlNQ0WbqO306YqQ15Zfvown7C19yogK3hPhNGxt4VjAKAXT9GUcti5zMCItVUqtRSc8LjSfQurnJun7Haz4qTc6xDDqD8vl+9z6U7HKaM0uTgW98hcXwe1yE4CcP2Dr0EW+WxHXdyGK3PvTOwK7kVdA10xlq7pTRnauJd8wJX6XF7e0KDfpenOGaHnbv0Nga9J8gkRZya40AjUuqJYrpYzZCjRYaKfKrPv5u0vuV+sXWSPGvKwHTJPEXDLo28gSvdnbDnYeV1lQPCt3E0gWNbxaaRIISgpcaxSEJWfCAW2CvDkvMOorgiE5vWP0Omdg/m0yVl8UbmJAzSui9TGF9M7vOwSUreahvNlSKVPU3zGDj4EMlvHj2YQAxwvHx3HnLW4GmZNDiPccSzKh89NjSgyqwC9WCngVi/1QHHGNb8zgwJQwvU+6BYH6/UnkFhOHQaLncrOvTYHFOkYUI0wx42JFu6Pw0nbYA465uurQT6CkQlzzZuTQ+/ulk5MDeQkq2hRRx8JAPZjwC4t8QImOQfB4lf0vRoWxbl2pCufScxlgEW3NwWQyzFm+XaPt9K1CfKRB5zkBcfU7yIdrx1gBNgW2TURUy6yJC07QKS8Tal0RChFb6Ro35PrVK+qjs3Rys27itfG6NdOJW6gMeKZFOSv1uTLbG1Fray9E=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5372.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f0845a-7515-456f-4399-08db40280de4
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2023 16:14:57.8868
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tt7vxkR3EqVDtoR/btQwoiP/mlz313byrHkZF9jIwYzK+NsSKGBLmmGpOoL+qmcMdN2ABjhlGYWDBNsxPS2DiNNgK4ylzoZyWZDlqZi6ih4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6130

> From: Andrew Cooper <Andrew.Cooper3@citrix.com>=0A=
> Sent: Monday, April 17, 2023 2:47 PM=0A=
> To: Jan Beulich <jbeulich@suse.com>; Xen-devel <xen-devel@lists.xenprojec=
t.org>=0A=
> Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>; Ross Lagerwall <ross.=
lagerwall@citrix.com>; Stefano Stabellini <sstabellini@kernel.org>; Julien =
Grall <julien@xen.org>; Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Ber=
trand Marquis <bertrand.marquis@arm.com>; Roger Pau Monne <roger.pau@citrix=
.com>; Wei Liu <wl@xen.org>=0A=
> Subject: Re: [PATCH v2 1/3] xen/ELF: Fix ELF32 PRI formatters =0A=
> =A0=0A=
> On 17/04/2023 1:31 pm, Jan Beulich wrote:=0A=
> > On 17.04.2023 14:13, Andrew Cooper wrote:=0A=
> >> --- a/xen/common/livepatch_elf.c=0A=
> >> +++ b/xen/common/livepatch_elf.c=0A=
> >> @@ -310,12 +310,12 @@ int livepatch_elf_resolve_symbols(struct livepat=
ch_elf *elf)=0A=
> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=
=0A=
> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
> >> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dprintk(XENLOG_DEBUG, LIVEPATCH "%s=
: Undefined symbol resolved: %s =3D> %#"PRIxElfAddr"\n",=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dprintk(XENLOG_DEBUG, LIVEPATCH "%s=
: Undefined symbol resolved: %s =3D> 0x%08"PRIxElfAddr"\n",=0A=
> > I don't see what's wrong with using %# here (and below); I also don't s=
ee=0A=
> > what value it has to zero-pad to 8 digits when the printed value either=
=0A=
> > is far below 4G (when representing just a section offset) or likely far=
=0A=
> > above (when representing a real address on 64-bit). But once again I'll=
=0A=
> > leave judging to the maintainers.=0A=
> =0A=
> Hmm - I could be persuaded to drop everything in livepatch_elf.c.=A0 I=0A=
> guess that makes it more consistent with the 64bit side too.=0A=
=0A=
Indeed, I would prefer without the changes in xen/common/livepatch_elf.c=0A=
=0A=
With those dropped,=0A=
=0A=
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>=

