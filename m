Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3475B3526
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 12:25:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404152.646504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWbC8-0002fW-M7; Fri, 09 Sep 2022 10:25:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404152.646504; Fri, 09 Sep 2022 10:25:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWbC8-0002di-Ij; Fri, 09 Sep 2022 10:25:08 +0000
Received: by outflank-mailman (input) for mailman id 404152;
 Fri, 09 Sep 2022 10:25:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DhXk=ZM=amd.com=JYOTIRMOY.SHARMA@srs-se1.protection.inumbo.net>)
 id 1oWbC7-0002dH-7v
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 10:25:07 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9e427cf-3029-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 12:25:04 +0200 (CEST)
Received: from DM6PR12MB4297.namprd12.prod.outlook.com (2603:10b6:5:211::20)
 by DM4PR12MB7525.namprd12.prod.outlook.com (2603:10b6:8:113::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Fri, 9 Sep
 2022 10:24:59 +0000
Received: from DM6PR12MB4297.namprd12.prod.outlook.com
 ([fe80::badf:4ed4:db1d:e5d4]) by DM6PR12MB4297.namprd12.prod.outlook.com
 ([fe80::badf:4ed4:db1d:e5d4%3]) with mapi id 15.20.5612.014; Fri, 9 Sep 2022
 10:24:59 +0000
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
X-Inumbo-ID: a9e427cf-3029-11ed-9760-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqC06oa6aKSiDnk53lVAP2aZVhhOXZ2C3hVSbcEdMkttQyZwp42qApZGuzDagGu5/PfMhOdHvr6g4V3UFDgP+3faAJVFJBT3OeVq2Al+XaC1DSdcdEE6U5A0aH7rYFIemVHh4rtjoTrjNoNbMqlBl6VXWYQbUxkwDoiaKk6Q/fVi/VHZGcb8pYvpwIV7YJnYVWMK+2OA8HOMZomDbDFQiQwRZ8Cs2aTA+23rUUHoWlM85SfteP0CDibl61QZLa5fjQZKc5lzLmV8FQTNG1xUDPzmc4Ajob9VdWhPG3fgLcUiFgiVJlqJY3oUNeBlFGthKEwWqB5ztRWUstDSzqLmkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqRh3mz3r+v5TshHp2O3w0mHKEl5yzWZWHn/l/aTA1M=;
 b=SAdVH9Kv2ps8g4AlqqOuwSesvKAmy90inbTV93vcOMclzTWmwZv3//ltvwVLAZPSgvlXFW0bX4rZjkfs9Hsrlfmvb8kQxDSyAOUS+qo+h0OAiw1xfPACWQ91PtEd/48P8kCAj5cAaSnwSU5WFBvkG1uLjOt/XI7jWjzTbReq/wszNn6yHuKhjf1MnLuu5T6ZfA0gZtjMl/zloo4HpEZF0zQYTx/iFlQtpWSdJ6f3t6P1yhTbLm4Xep7QYswbn8viysnoi1iSyxCRVWmHSk9NJyc351VLE3xrM/DLv3A8hs+sT4FjhSQe3g0x30JSUhnXhQACe/A67ZqZW/qaaW+/yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqRh3mz3r+v5TshHp2O3w0mHKEl5yzWZWHn/l/aTA1M=;
 b=G6TcwVxsf87NNKVB8irHKEtMzeL8RjbruZlduLJ6f+Eg+EQPs5e3SUjMX949UJEYRIr2i76byIpe1Wvv1J6z96OgBOqEivBBWoiXZN3tRmMs63ovqQlweY/0StdBJjS4Os5M0wWbC/WWws/V7RceONjDoqRSpWVDAs9gLmXTLpg=
From: "SHARMA, JYOTIRMOY" <JYOTIRMOY.SHARMA@amd.com>
To: "xen-users@lists.xenproject.org" <xen-users@lists.xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: libxl source code
Thread-Topic: libxl source code
Thread-Index: AdjENV78escYILheRq+LqRiZYu2hAQAAP/9A
Date: Fri, 9 Sep 2022 10:24:59 +0000
Message-ID:
 <DM6PR12MB4297F8894C8867A67C07C4789F439@DM6PR12MB4297.namprd12.prod.outlook.com>
References:
 <DM6PR12MB4297E6A74761806DE47A937E9F439@DM6PR12MB4297.namprd12.prod.outlook.com>
In-Reply-To:
 <DM6PR12MB4297E6A74761806DE47A937E9F439@DM6PR12MB4297.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-09-09T10:24:57Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=33c19e88-ba85-4ae7-b306-256e35b401c5;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB4297:EE_|DM4PR12MB7525:EE_
x-ms-office365-filtering-correlation-id: 7456814c-1401-4e5d-e70c-08da924d8cbc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 /X5jSuOl66tObs9J9T6ljsR+Sco9of2kRCR54ynhvRBKLJjAqveBZNrVeJg7fKNsJhB+u5vS2KPHKwAEDUX8n54bX0idtQQM3fENz2zR+iPIXXortjlSAAltELV+Ujmi81CkotGFTRxjo0xjg8w8HIUF+AqL5y8dSCuyHkQDED+5TkwmNLa87xVuUax8K3cUeYxYzJVttt0A0OJBaA8j2N0GLN621SOVFvfKnuXKBDXacSj+Kf+FNL3WGAjAsWDXAjVtFwyd1KoYe8Tn++uSPsn0PVbICBpMbA/+198wAsy22FbMYuR6GDkMDHt+DVuIxL62plvbdPnEFRgXPXDxLGdLlxFZ5j4TibHuXRuhB6Rzu+Wc4W2EVvh8HW5QEWAOa1uAHsqcmWzkJA1FJzSW75EbO3GyImU3VMeKGiTnhbCMQxluCgzpVWDglQ5Wr+qK6twHa3nR+yG5sRoz9Y5RqPHvmKrgN28I1DxX0MwxZp0NECP01HqM9gQVMDvvT5zxgJZfCiRa2rdm7D0oUoIk6a0M9EkRSbZwOhTSS6xmjZIa7FKANWEugnBn3qkolvMM7cEnOonyOF6gnt70dRH5Edzw2wf2NtRRDFMILBfFv1eYJqQTnNLIXOIeVCMCWULjyU7dlGX5vdlmT8tdGSgrqfQKYpaSQCMmr/17cmJbgNTBsiXb0sQqanoRNTmCLW7xTwsWX35bzKsiAYli4mU7ZM+nbJ1M9cyBl/N3ssN3+FGstF2ApjPEgjmfjERHCJysmry1QXGnmgJ8XwDJj2wlcA+kjBvSUjOy+b8QIJryw0rTyp7y7GLWae8p0UQMWxZuOK/OHV4mIkCgktksjzA1uw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4297.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(396003)(136003)(346002)(366004)(66946007)(6506007)(478600001)(76116006)(316002)(33656002)(38100700002)(3480700007)(450100002)(122000001)(110136005)(86362001)(7696005)(186003)(7116003)(55016003)(66446008)(966005)(64756008)(66556008)(2906002)(26005)(9686003)(8676002)(66476007)(5660300002)(52536014)(53546011)(38070700005)(8936002)(166002)(2940100002)(71200400001)(4744005)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8gf1pY/slrIsQCkz6FLZBJFmT5/DsxbTmUIhMJMBn9yA6urjWgSF1djnuROT?=
 =?us-ascii?Q?WMZSIUcG2FS9WzUy+cqhzkuWwoQRxznBZ2h1jThkO9+AmjEXCBI3zqWyiL8t?=
 =?us-ascii?Q?CWHcCTrenmRKq2+ElQT6c22Y4uUqbezsImH5PYI2vHwjmAbna9OUxCD7gVQ3?=
 =?us-ascii?Q?rJnSwtQdUHzeywZNN7caYNxwkECJqny+RPIGLRUNtIjnW/aNQVMvG4qNmnsd?=
 =?us-ascii?Q?FCaLy1WuptbUcmArRo3CVdy3dWsiKyJgnU86FTMu9SzLnJ2O381VhibYdn8U?=
 =?us-ascii?Q?ZFcAnq+a2Rb+odzrLp6nX2DcUKZQNAFvdKN6lPO6dntihpsK6SwBdc/5ZWvC?=
 =?us-ascii?Q?5MonvAM9mBNpoaD1XIVpM4W2urf1TTRglMkf4h9SadBOMhaXfnQWdSDQ0l3d?=
 =?us-ascii?Q?vUr200osV4NlX/6LZzwXQt2ZvPw9w+iwHR8dC4u81NMSa1DJlmfZGBfN3alU?=
 =?us-ascii?Q?hN7QVdagjmKbx8JHGbq4V8WF2ZT8tIWxI362bmIGqd21Af+CrEDbrCAEyLYL?=
 =?us-ascii?Q?Aewulst5jOitltlKjYaNNaUyjJifq8eQi5V8g03i6HIgARn7a+UCiOogEMdm?=
 =?us-ascii?Q?09P4QCYQiy+R+FzAWukwPBxMSQSA7Vvq3THmyC7hu4gWCvM127NFlIoo20/f?=
 =?us-ascii?Q?X5yqmNgqEtZcI87KV8Zhoo1zpHo60Acra2CF0hcMF5k+0nZHBMLr+si25EAl?=
 =?us-ascii?Q?WEH8UrD2iuCP9uNYuDWQrtcPsFmEZZzwfI62ycKKsdCrWQj6l8ge4MoAgqyy?=
 =?us-ascii?Q?OzSUxezLYqVyH/tqdqQY3qcjQPXBXvKf01asTqLA+rVIqe9uSDPMULqeBG/l?=
 =?us-ascii?Q?iSesWUGfC8SGBIuYNp1stX44QzaBW83TFxWBpEDeli6PdOx0FaL+TeBCYMZv?=
 =?us-ascii?Q?oixxUSWCwQn7R+aEEIcykVoFiJyDJlklAdalMGrWb3r4c8WwqbeIkCPkLHSM?=
 =?us-ascii?Q?Mhvk+cRwp1dIyR7QQQCvSDfGUAnYC9xmfS7F0+tIT+YFs0BWxdpa0xLxtcWS?=
 =?us-ascii?Q?gmYjfXdKx3iBh3/o+dz6dQ2Fn/6dEz3TRrxWEFmxhrR70tE59bXR7knZJC+i?=
 =?us-ascii?Q?BlDtljgRkw2yYSuv+tsFnHMacMNm5Sqclb/JMMrq7ecibZC4qJPxR7yo/MuK?=
 =?us-ascii?Q?HpCvDr5NvqRCbiQQWUqOJmVardKhTVk5migAffGXNSHIKNmSiedd4IK2TwvN?=
 =?us-ascii?Q?IVTEbhBfuOeG2Ap8tKB4Tp0xecfVQY9O2sFNHyuCLGBuDCo6ePp3thytwpIR?=
 =?us-ascii?Q?hCgDpCM9QGLHlmjQpS53TnV0wiBHfIkthEqInSgJCTKgVW+w4S+lXdQV7kAo?=
 =?us-ascii?Q?cGcqy4m/z0+tv5uCkJTwZRRbPjWByqP25rqjAXeqpSX+KN2wSh3J+rjuVe0W?=
 =?us-ascii?Q?YAcLV1YQScJXNnSy5YWMfIZh+GSHkSZ4gL6zP6TBdpt0lHSSF7HQsM5m8Yyn?=
 =?us-ascii?Q?s520BAu7151BwjAmYIY3o2mWHO7SwIXtORy4+CuDzAbpQQaa8vI1yr0FY3py?=
 =?us-ascii?Q?3fXWUvObb2hXJUzsavXfmhBYpin7tQo+05tUkb4U90ePbFZKyFxR7y9WJcLJ?=
 =?us-ascii?Q?1CcUbDM6hkT/t7CiGbuU7ghDRKohJcpGJsKtqjqI?=
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB4297F8894C8867A67C07C4789F439DM6PR12MB4297namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4297.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7456814c-1401-4e5d-e70c-08da924d8cbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2022 10:24:59.7361
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oobhJltki3PUmWP2Ezf2iJnvQ5Uy+eX5fmnBZwdnNRG89TQPGNPcGE9fzhsd1xDF/2Mfz3yAPLB3MHiqpwJexQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7525

--_000_DM6PR12MB4297F8894C8867A67C07C4789F439DM6PR12MB4297namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Adding xen devel

Regards,
Jyotirmoy

From: SHARMA, JYOTIRMOY
Sent: Friday, September 9, 2022 3:52 PM
To: 'xen-users@lists.xenproject.org' <xen-users@lists.xenproject.org>
Subject: libxl source code


[AMD Official Use Only - General]

Hello,

I am looking for the libxl source code to understand how vsnd (PV audio dri=
ver) has been implemented.
However, if I look into the xen source tree (https://xenbits.xen.org/gitweb=
/?p=3Dxen.git;a=3Dtree;f=3Dtools;h=3D9b2efe082223bbf60b41e947ceb4821e98708c=
02;hb=3Drefs/heads/stable-4.16),
I do not see libxl folder.

Specifically I am looking for the code which is present in the following pa=
tch set:

https://lore.kernel.org/all/1509548687-6071-3-git-send-email-al1img@gmail.c=
om/

Can you please help me locate the source files in this patch set?

Regards,
Jyotirmoy


--_000_DM6PR12MB4297F8894C8867A67C07C4789F439DM6PR12MB4297namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
p.msipheaderdf3d92d6, li.msipheaderdf3d92d6, div.msipheaderdf3d92d6
	{mso-style-name:msipheaderdf3d92d6;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"msipheaderdf3d92d6" style=3D"margin:0in"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:blue">[AMD Officia=
l Use Only - General]</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Adding xen devel<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Jyotirmoy<o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> SHARMA, JYOTIRMOY <br>
<b>Sent:</b> Friday, September 9, 2022 3:52 PM<br>
<b>To:</b> 'xen-users@lists.xenproject.org' &lt;xen-users@lists.xenproject.=
org&gt;<br>
<b>Subject:</b> libxl source code<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"msipheaderdf3d92d6" style=3D"margin:0in"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:blue">[AMD Officia=
l Use Only - General]</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am looking for the libxl source code to understand=
 how vsnd (PV audio driver) has been implemented.<o:p></o:p></p>
<p class=3D"MsoNormal">However, if I look into the xen source tree (<a href=
=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dtree;f=3Dtools;h=3D9b2e=
fe082223bbf60b41e947ceb4821e98708c02;hb=3Drefs/heads/stable-4.16">https://x=
enbits.xen.org/gitweb/?p=3Dxen.git;a=3Dtree;f=3Dtools;h=3D9b2efe082223bbf60=
b41e947ceb4821e98708c02;hb=3Drefs/heads/stable-4.16</a>),<o:p></o:p></p>
<p class=3D"MsoNormal">I do not see libxl folder.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Specifically I am looking for the code which is pres=
ent in the following patch set:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://lore.kernel.org/all/1509548687-60=
71-3-git-send-email-al1img@gmail.com/">https://lore.kernel.org/all/15095486=
87-6071-3-git-send-email-al1img@gmail.com/</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Can you please help me locate the source files in th=
is patch set?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Jyotirmoy<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM6PR12MB4297F8894C8867A67C07C4789F439DM6PR12MB4297namp_--

