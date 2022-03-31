Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 163234ED71A
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 11:38:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296826.505387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZrFX-0002A6-Fn; Thu, 31 Mar 2022 09:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296826.505387; Thu, 31 Mar 2022 09:37:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZrFX-00028G-CN; Thu, 31 Mar 2022 09:37:51 +0000
Received: by outflank-mailman (input) for mailman id 296826;
 Thu, 31 Mar 2022 09:37:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZr8B-00057w-QY
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 09:30:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b92bb21-b0d5-11ec-a405-831a346695d4;
 Thu, 31 Mar 2022 11:30:15 +0200 (CEST)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2054.outbound.protection.outlook.com [104.47.5.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-U0TuF9ktOt-h5zTVKqsFpQ-1; Thu, 31 Mar 2022 11:30:05 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB4817.eurprd04.prod.outlook.com (2603:10a6:208:c2::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.21; Thu, 31 Mar
 2022 09:30:04 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 09:30:04 +0000
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
X-Inumbo-ID: 2b92bb21-b0d5-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648719014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3QN0fYa0oMl7IDnTsZt7IRjYRX2ba78F7K2wvp/PpMw=;
	b=ZCt6B91Oa7DiTlHVE5OnFiW0b8QX5JytE/Dya4+OoDRRw3bQMTRdI4NZvfo8HymdgKePwp
	q++0ThB+ZX/19nUHxd71NLVacsq27sFSK51emuo3zdhcfI+oeuomyk/pk0pckv4nzHZJky
	+X28gEoBu1JgBuFViEMoKd42vsxS4d0=
X-MC-Unique: U0TuF9ktOt-h5zTVKqsFpQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mE/dgmmFpD1MHBeaiac2Qb1sN1o2XByB6vGhfD69zJYIXi6k+0wla+sTKN1RETZgxxhF6YfkYQLBK2mYqsL5vvO8fcSyWgdKRrUNKLtZKD8lHkyU0L6/jUJbzzfpuiIDg2D1BtnMZ74BN/M+S4V9KnGtrRI0QU9o7CP8CiSt9fcfq12K2NNXPYhM9iRuYRhTIutbppwmGb57PEZgmJnsN3fr+di0TAQWEMH3kd3p6/SFFxsVgB+NZp9bfrINIB0+gy2XWLhQUPcZZ/rXiuXKUEmBTYySzYSDaBYdy1cMtCa717Gugebxq16e0t1eICk+CSpJyEHv/hrJzAcSIsWrsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcbWh8araaOsLGTP+eR3aRWtZQ9q+jMuD82Drem89xU=;
 b=mk1sNRcZYfCYDBJ/0WAGcQD8JLkqXjtNHcXILSwHdu7m7F15jz1e/ldE7UEVr3vNEHZ+hS7tN54cTo80RdYNsY8/pw5E3QR+NzJBX0HHcF50WIyArF0vS6y/OoJzW3Q4HYK1aiUaCySiG1gvnlK15HiTD5VUdYGBP4oJ+TfYb5U8RjjXK/CE6HnTF7vchfCYJkdm+SBVyMD2Med2JBTrzB6u2+XrXy6JA/D4/uHrXBxcuNlVLdM7jKrntweXUQVmEUVNS0TANVB2lWcj5bdFReOMoG2MROaYoodZND55/iFzqDPXdw3MgsKjDYt65gmgGHACKAS8aCU324b9vBSmKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a6401a97-4528-595a-4baa-d41ea42a198c@suse.com>
Date: Thu, 31 Mar 2022 11:30:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: [PATCH v4 2/4] x86/APIC: make connections between seemingly arbitrary
 numbers
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <6e540bc9-c536-84ac-fb1c-8271e7731b3e@suse.com>
In-Reply-To: <6e540bc9-c536-84ac-fb1c-8271e7731b3e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR07CA0022.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::17) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 913e51fd-876e-41dc-fcf9-08da12f9099c
X-MS-TrafficTypeDiagnostic: AM0PR04MB4817:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB48176915D0C42113336EE0E6B3E19@AM0PR04MB4817.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tYLzOJJY8URVXEMKABH47c+scSVSO6nA5Ip4Ktj+feTSn9rHyhF4ZT1NQK0a77dME5lg+eDGjL6Nj2UFnye2Ebucj7xHf1eaJPNe2yKAtRlw/Rb5qGLeDdK0itsbpAcUsNIXn1rvNSGl31LptOsFBgO5BKwTCbwwzwzNmGn3nzQ0lSeCZ61V3OhpXDYK90fYtK7eTL05dgmqxA45MbMv7sNh8a+bTwmoms5VQ9endsh5N20N6Fi7QODUwhYhxht8PMVt1Glr13nE0c3gogKsCg+ODMsQ4xD/goL+gWeNzuMNqpxRLLW84ezfmPQqQ3LxZmg8IDiqwdIK3v1s+aV9hp/uDSFpi8in/Wwkf624s3Wd1DmUJaOYLvFt7AWNZH3Iixibgyefq+8sL04OLWRo/1mRnW30zA+xA8bDrjBuGwNFYfw9xVCO7ebaNl0zeK/Yi92g+JBkA0TvNRLrRZCCRSqXlp/6CM7aEoGa8SqDXpmHHjJLJAmDB3+70BYOm7C3dljEkK+/Hmq8XyKpum2K6rvaMOrr+2wuZCp5XfVvA5nbYucaszmId62WOw9Y2Glk+oP29qTXtduS1sQvpTwFEpIOWTjJKdFIeOrjSt6fsArTZO5DAhrZMuAplhkQf49Vh0J/+MK9uw/4JuaDwtCIK2YucntVm0uE1rzmXiTVGdOnjfOBSZxXik9S4lpYd2acxYOTXnqgYhtSEpBQ6VFY21dQgnYZTec3gKj1WadBA4iXc0ncHGvGnXaV82Z6I3dI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(38100700002)(31686004)(5660300002)(508600001)(186003)(83380400001)(8936002)(26005)(2906002)(316002)(8676002)(4326008)(66476007)(31696002)(54906003)(6916009)(66946007)(86362001)(66556008)(2616005)(6506007)(6512007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?11HFNgP9te8TFcyFrr6mtsEjqwkLTfK7IKU1v0OUGdhPicbl60VRWuYNFH04?=
 =?us-ascii?Q?j8I/umHdU73pMY7VSub+bn2iriyQeern8fbHIJfLQ6xge58xGadetvRXOKJZ?=
 =?us-ascii?Q?5+QRUMjoX1NXZ9Ui0TeqlnQf75gDRmydV9Di7T53h66DHggQcOgs4Gz+G9+l?=
 =?us-ascii?Q?TLKDF3nIou97/fKLE1LiyeCKuEhTgA4bqI5FdiMaOsFXP+MGT+ELodhBdtcD?=
 =?us-ascii?Q?ELvb+DZHpGM1JtL0AhRxv8oOvGy27scoZ/pu1qzDvjRZcLhea3LSfdNY1Fz4?=
 =?us-ascii?Q?JuXjja8YVerWAj7DQUoSINzBo2kEOaOAH4NmR5QDjEqCmgX29VrYd29e1Kx+?=
 =?us-ascii?Q?TFtYg8qSGZ2RNq6JZl0bKEInZpYTd06akvt08x55W8pm+z1WstcQ7K2WG+9F?=
 =?us-ascii?Q?4r2jhCG/LUcbmae6jdfdwmESHgYPo5TOYRh6Ly4/fTvGeQDB9vWK8DXaZR0F?=
 =?us-ascii?Q?upii1thJCbJrJJk4RjvYOtWrPyiYE2+jWXDyMYScRWtRekmaf3ExlpRDYJVq?=
 =?us-ascii?Q?LgKx1AYgBkn9NEfJMCfkSoBiOen0ieIcG+ocpcldq7RkgUkrlMWq4H9nTgLv?=
 =?us-ascii?Q?/5gTBRI2Ym0AjlJwTrbL3b0tRjMqzOgja1e/nx1J/HOatXJcyl0Uhso2/Tve?=
 =?us-ascii?Q?gnBIe4fCG0H7LTeI53xaS6ixIjyfSQqkBjrca8oTVUlmCcpX03WebOzUN9AB?=
 =?us-ascii?Q?gSXRHS9UFR3Ga7d9oBNAtbHzdWnNZ3oKhANZvhubRGwREHiJpU4bTe1/ycP3?=
 =?us-ascii?Q?W9Vd2Nak5zoFI2I0/u5diIbsuzoV30T2gxw71ip1bkY2aRzOPnENTW/Yr81W?=
 =?us-ascii?Q?Pejo1A/omqL2vwYx2tWTdwr65mAUwC+GNp0acRwMXYa2z2x5nZdcIHps8BXu?=
 =?us-ascii?Q?906aDM8l4qc6BKfW8Ho7pUqZV3BUueTU/C5iMcv1knWn7Hj83nwPBM1sOKAM?=
 =?us-ascii?Q?Kz7Ece1Zkw6jZWFtaP0P/1FpwusdHzc0aZ7w2kRqY3LhCoAMeZEVT6P9UFKv?=
 =?us-ascii?Q?UEHwmyr9jPM6UFQ28AKia+oNMwSK/ZabiDHwiBjAyuB+r6wcou1ZNwb0Twud?=
 =?us-ascii?Q?pbkv3+pAFLDq+QD/Pf4Sg6BrxZUgdrwgqCveIsa342yzrhT7nEnBrvcNZT7N?=
 =?us-ascii?Q?puaHwzPjyxW2gb/1wYnyIap2xNuvASgOWurIR/ovta8tJgzXdEmSTEbd/mpM?=
 =?us-ascii?Q?1JjNCH8o/abaAsc/IKkCXqaNKoToQUmduuScChSJQGYgau6K0v5Uf0/cuV3p?=
 =?us-ascii?Q?DBZ8moBxYwQeM7d+QO7x49oynTPzWnGdSIb44aWhhefzMH4ge4NCNU7uLMlE?=
 =?us-ascii?Q?kXISa6pPJw9TiDa9+3ObqUW3mqi60oWWxSLOBfMxrgvJW646QKYMZRooB7U4?=
 =?us-ascii?Q?nlosd2lbLU0oX23nUE1920hVBduWWFBNN63+8hQ1XMUO2da3yDwf4XxJXV8a?=
 =?us-ascii?Q?gsKPCyNB3tYvmqxFVQurgJtTmcwCFsyJzv0CllqVryaFwT4UE9l8LWdBoLDY?=
 =?us-ascii?Q?WTL3Xm9nqsQRtvtKhL1gRRStNUkAVlBz4I/onszmpmc0SrmRL8YFeouPuWzo?=
 =?us-ascii?Q?ppc1rCS8nkK4Fj6dEazvT2OuIdBpQr1vhk6tB1YnyjFX6bxDyAgc8g1ZP4o6?=
 =?us-ascii?Q?zmfdE7lvTZaAGzKYsyad688PiMR4Ca9Mg/7uxPHucMSOh2y/WAfT3OVYkT9m?=
 =?us-ascii?Q?g1x9XO9SbFuXUFEWX2Brd4Va4c8inl1AsUMTjFHxU+w08uvz7u/6sH8FzW1n?=
 =?us-ascii?Q?ur0YfvN9Sw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 913e51fd-876e-41dc-fcf9-08da12f9099c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 09:30:04.4723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xjZ1aTJ7T1kf4pyTcCMMTUIc814PdL2n+rEIRPpVgZFjb9oMpSj4uV46orw/KIIXacs73BigcNPOPgBdeByPXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4817

Making adjustments to arbitrarily chosen values shouldn't require
auditing the code for possible derived numbers - such a change should
be doable in a single place, having an effect on all code depending on
that choice.

For one make the TDCR write actually use APIC_DIVISOR. With the
necessary mask constant introduced, also use that in vLAPIC code. While
introducing the constant, drop APIC_TDR_DIV_TMBASE: The bit has been
undefined in halfway recent SDM and PM versions.

And then introduce a constant tying together the scale used when
converting nanoseconds to bus clocks.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
---
v3: Introduce and use PASTE() instead of (ab)using _AC().
v2: New.

--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1078,8 +1078,8 @@ static void __setup_APIC_LVTT(unsigned i
     lvtt_value =3D APIC_TIMER_MODE_ONESHOT | LOCAL_TIMER_VECTOR;
     apic_write(APIC_LVTT, lvtt_value);
=20
-    tmp_value =3D apic_read(APIC_TDCR);
-    apic_write(APIC_TDCR, tmp_value | APIC_TDR_DIV_1);
+    tmp_value =3D apic_read(APIC_TDCR) & ~APIC_TDR_DIV_MASK;
+    apic_write(APIC_TDCR, tmp_value | PASTE(APIC_TDR_DIV_, APIC_DIVISOR));
=20
     apic_write(APIC_TMICT, clocks / APIC_DIVISOR);
 }
@@ -1212,6 +1212,8 @@ uint32_t __init apic_tmcct_read(void)
  * APIC irq that way.
  */
=20
+#define BUS_SCALE_SHIFT 18
+
 static void __init calibrate_APIC_clock(void)
 {
     unsigned long bus_freq; /* KAF: pointer-size avoids compile warns. */
@@ -1265,8 +1267,8 @@ static void __init calibrate_APIC_clock(
     /* set up multipliers for accurate timer code */
     bus_cycle  =3D 1000000000000UL / bus_freq; /* in pico seconds */
     bus_cycle +=3D (1000000000000UL % bus_freq) * 2 > bus_freq;
-    bus_scale  =3D (1000*262144)/bus_cycle;
-    bus_scale +=3D ((1000 * 262144) % bus_cycle) * 2 > bus_cycle;
+    bus_scale  =3D (1000 << BUS_SCALE_SHIFT) / bus_cycle;
+    bus_scale +=3D ((1000 << BUS_SCALE_SHIFT) % bus_cycle) * 2 > bus_cycle=
;
=20
     apic_printk(APIC_VERBOSE, "..... bus_scale =3D %#x\n", bus_scale);
     /* reset APIC to zero timeout value */
@@ -1353,7 +1355,8 @@ int reprogram_timer(s_time_t timeout)
     }
=20
     if ( timeout && ((expire =3D timeout - NOW()) > 0) )
-        apic_tmict =3D min_t(u64, (bus_scale * expire) >> 18, UINT_MAX);
+        apic_tmict =3D min_t(uint64_t, (bus_scale * expire) >> BUS_SCALE_S=
HIFT,
+                           UINT32_MAX);
=20
     apic_write(APIC_TMICT, (unsigned long)apic_tmict);
=20
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -580,7 +580,7 @@ static uint32_t vlapic_get_tmcct(const s
 static void vlapic_set_tdcr(struct vlapic *vlapic, unsigned int val)
 {
     /* Only bits 0, 1 and 3 are settable; others are MBZ. */
-    val &=3D 0xb;
+    val &=3D APIC_TDR_DIV_MASK;
     vlapic_set_reg(vlapic, APIC_TDCR, val);
=20
     /* Update the demangled hw.timer_divisor. */
@@ -888,7 +888,7 @@ void vlapic_reg_write(struct vcpu *v, un
     {
         uint32_t current_divisor =3D vlapic->hw.timer_divisor;
=20
-        vlapic_set_tdcr(vlapic, val & 0xb);
+        vlapic_set_tdcr(vlapic, val);
=20
         vlapic_update_timer(vlapic, vlapic_get_reg(vlapic, APIC_LVTT), fal=
se,
                             current_divisor);
@@ -1020,7 +1020,7 @@ int guest_wrmsr_x2apic(struct vcpu *v, u
         break;
=20
     case APIC_TDCR:
-        if ( msr_content & ~APIC_TDR_DIV_1 )
+        if ( msr_content & ~APIC_TDR_DIV_MASK )
             return X86EMUL_EXCEPTION;
         break;
=20
--- a/xen/arch/x86/include/asm/apicdef.h
+++ b/xen/arch/x86/include/asm/apicdef.h
@@ -106,7 +106,7 @@
 #define		APIC_TMICT	0x380
 #define		APIC_TMCCT	0x390
 #define		APIC_TDCR	0x3E0
-#define			APIC_TDR_DIV_TMBASE	(1<<2)
+#define			APIC_TDR_DIV_MASK	0xB
 #define			APIC_TDR_DIV_1		0xB
 #define			APIC_TDR_DIV_2		0x0
 #define			APIC_TDR_DIV_4		0x1
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -13,6 +13,10 @@
 #define count_args(args...) \
     count_args_(., ## args, 8, 7, 6, 5, 4, 3, 2, 1, 0)
=20
+/* Indirect macros required for expanded argument pasting. */
+#define PASTE_(a, b) a ## b
+#define PASTE(a, b) PASTE_(a, b)
+
 #ifndef __ASSEMBLY__
=20
 #include <xen/inttypes.h>


